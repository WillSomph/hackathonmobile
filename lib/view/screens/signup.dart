import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarteco/view/widgets/Custom_Text_field.dart';
import '../../viewmodels/signup_viewmodel.dart';
import '../../models/user.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _cityController = TextEditingController();
  final _professionController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signupViewModel = Provider.of<SignupViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        //child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 41,),
                  Image.asset('lib/assets/logo.png', height: 169, width: 167,),
                  SizedBox(height: 47),
                  CustomTextField(labelText: "Nom", controller: _nameController),
                  SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Prénom',
                    controller: _surnameController,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child:  CustomTextField(
                          labelText: 'Date de naissance',
                          controller: _birthDateController,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomTextField(
                          labelText: 'Ville',
                          controller: _cityController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Profession',
                    controller: _professionController,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Email',
                    controller: _emailController,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Mot de passe',
                    controller: _passwordController,
                    isPassword: true,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Confirmer le mot de passe',
                    controller: _confirmPasswordController,
                    isPassword: true,
                  ),

                  SizedBox(height: 25),
                  if (signupViewModel.errorMessage != null)
                    Text(
                      signupViewModel.errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');// Naviguer vers la page de connexion
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: <TextSpan>[
                        TextSpan(text: 'Vous avez déjà un compte?\n'), // Texte normal
                      TextSpan(
                        text: 'Connectez-vous',
                        style: TextStyle(fontWeight: FontWeight.bold), // Texte en gras
                      ),]
                        ))
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final user = User(
                          name: _nameController.text,
                          surname: _surnameController.text,
                          birthDate: _birthDateController.text,
                          city: _cityController.text,
                          profession: _professionController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        final success = await signupViewModel.signup(user);
                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Inscription réussie'),),
                          );
                        }
                        Navigator.pushNamed(context, '/welcome');
                      }
                    },style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50), // Largeur maximale, hauteur 50px
                    backgroundColor: Color(0xFF2D5FCB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // Bordures arrondies
                    ),
                  ),
                    child: Text('Inscription', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
          ),
        //),
      ),
    );
  }
}
