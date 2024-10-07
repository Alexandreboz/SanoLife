import 'package:flutter/material.dart';
import 'home_page.dart'; // Import de la page d'accueil

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
      home: HomePage(), // Utilisation de la page d'accueil
    );
  }
}
