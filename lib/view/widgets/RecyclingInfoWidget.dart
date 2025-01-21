import 'package:flutter/material.dart';

class RecyclingInfoWidget extends StatelessWidget {
  final String imagePath;
  final int count;
  final int average;

  const RecyclingInfoWidget({
    Key? key,
    required this.imagePath,
    required this.count,
    required this.average,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image personnalisée
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white, // Fond blanc autour de l'image
            borderRadius: BorderRadius.circular(12.0), // Bordures arrondies
          ),
          child: Image.asset(
            imagePath,
            width: 42.0, // Largeur de l'image
            height: 42.0, // Hauteur de l'image
          ),
        ),
        const SizedBox(width: 16.0),
        // Texte et chiffres
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$count déchets recyclés', // Texte principal
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'contre $average en moyenne', // Texte secondaire
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey, // Couleur gris clair
              ),
            ),
          ],
        ),
      ],
    );
  }
}
