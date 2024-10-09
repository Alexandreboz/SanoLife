import 'package:flutter/material.dart';
// import 'home_page.dart'; // Import de la page d'accueil
// import 'home_page.dart';
// import 'espace_accueil.dart';
// import 'tableau_de_bord.dart';
// import 'signup_page.dart';
// import 'login_page.dart';
import 'start.dart';
// import 'scan.dart';
import 'traitement.dart';

void main() {
  runApp(MediApp());
}

class MediApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home: WelcomePage(), // Utilisation de la page d'accueil
    );
  }
}
