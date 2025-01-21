import 'package:flutter/material.dart';
import 'package:smarteco/view/widgets/Custom_Text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 41,),
                  Image.asset('lib/assets/logo.png', height: 100), // Logo
                  SizedBox(height: 111),
                  CustomTextField(
                    labelText: 'Email',
                    controller: _emailController,
                  ),
                  SizedBox(height: 23),
                  CustomTextField(
                    labelText: 'Mot de passe',
                    controller: _passwordController,
                    isPassword: true, // Champ masqué
                  ),
                  SizedBox(height: 33),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');// Naviguer vers la page d'inscription
                    },
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(text: 'Pas encore de compte?\n'), // Texte normal
                              TextSpan(
                                text: 'Inscrivez-vous',
                                style: TextStyle(fontWeight: FontWeight.bold), // Texte en gras
                              ),]
                        ))
                  ),
                  SizedBox(height: 33,),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Logique de connexion
                        print("Email : ${_emailController.text}");
                        print("Mot de passe : ${_passwordController.text}");

                        Navigator.pushNamed(context, '/welcome');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50), // Largeur maximale, hauteur 50px
                      backgroundColor: Color(0xFF2D5FCB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25), // Bordures arrondies
                      ),
                    ),
                    child: Text(
                      'Connexion',
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
