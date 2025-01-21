import 'package:flutter/material.dart';
import 'package:smarteco/view/widgets/RecyclingInfoWidget.dart';
import 'package:smarteco/view/widgets/TabProduct.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF2D5FCB),
        elevation: 0,
        title: Image.asset('lib/assets/logo_w.png', height: 40, width: 40,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 52),
            const Text(
              'Bienvenue Patrick !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text("Rechercher un Produit",textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),),

            // Champ de recherche
            SizedBox(
                width: 200,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
              ),
            SizedBox(height: 10),
            Text("ou", textAlign: TextAlign.center,),
            SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
              onPressed: () {
              // Action du bouton ici
              },
              child: Text('Scanner le code barre', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                backgroundColor: Color(0xFF2D5FCB),
                padding: EdgeInsets.zero,
              ),
            ),),
            SizedBox(height: 52),

            // Statistiques sur les déchets
            RecyclingInfoWidget(
              imagePath: 'lib/assets/logo.png', // Chemin de l'image
              count: 10, // Nombre de déchets recyclés
              average: 5, // Moyenne
            ),
            SizedBox(height: 34),


            RecyclingInfoWidget(
              imagePath: 'lib/assets/logo.png', // Chemin de l'image
              count: 10, // Nombre de déchets recyclés
              average: 5, // Moyenne
            ),
            SizedBox(height: 34),


            RecyclingInfoWidget(
              imagePath: 'lib/assets/logo.png', // Chemin de l'image
              count: 10, // Nombre de déchets recyclés
              average: 5, // Moyenne
            ),
            SizedBox(height: 54),

            // Tableau des derniers produits triés
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Derniers produits triés',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blue[800],
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildTableRow('Produit 1', 'Recyclé'),
                          _buildTableRow('Produit 2', 'Composté'),
                          _buildTableRow('Produit 3', 'Jeté et recyclé'),
                          _buildTableRow('Produit 4', 'Jeté'),
                          _buildTableRow('Produit 5', 'Jeté et composté'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String subLabel,
    required Color iconColor,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: iconColor,
        ),
        SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subLabel,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildTableRow(String product, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            status,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),
        ],
      ),
    );
  }
}
