import 'package:flutter/material.dart';
import '../models/user.dart';

class SignupViewModel extends ChangeNotifier {
  String? errorMessage;

  Future<bool> signup(User user) async {
    // Validation ou appel à un service d'API pour enregistrer l'utilisateur
    if (user.password.length < 6) {
      errorMessage = "Le mot de passe doit contenir au moins 6 caractères.";
      notifyListeners();
      return false;
    }

    // Simulation d'une inscription réussie
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
