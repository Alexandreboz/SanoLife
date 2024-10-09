import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Variables pour les champs du formulaire
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5E6), // Couleur de fond
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo en en-tête
              Container(
                width: double.infinity,
                color: Color(0xFF4169e1), // Couleur de l'en-tête
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  children: [
                    Image.asset(
                      'asset/image/sano_life2.png',  // Chemin du logo
                      height: 145,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre
                    Text(
                      "Créer mon compte",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Champs du formulaire
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nom',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Prénom',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Date de naissance',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Adresse mail',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Numéro de téléphone',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Checkbox pour les conditions générales
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            "Je certifie sur l'honneur d'avoir lu et accepter les conditions générales.",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Bouton pour créer le compte
                    Center(
                      child: ElevatedButton(
                        onPressed: _isChecked
                            ? () {
                                // Action pour la création du compte
                              }
                            : null, // Désactiver le bouton si les conditions ne sont pas cochées
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Couleur du bouton
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 100,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Créer mon compte',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
