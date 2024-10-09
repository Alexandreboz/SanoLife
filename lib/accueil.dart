import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5E6), // Couleur de fond similaire à celle de l'image
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Affichage du logo
                Image.asset(
                  'asset/image/sano_life.png',  // Chemin de l'image du logo
                  height: 300.0,
                ),
                SizedBox(height: 0),
                Text(
                  'Bienvenue sur SanoLife',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  "Découvrez une meilleure santé avec des recommandations personnalisées et un tableau de bord de santé dynamique. "
                  "Suivez vos progrès et atteignez vos objectifs de bien-être avec SanoLife.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                // Bouton de connexion
                ElevatedButton(
                  onPressed: () {
                    // Action pour se connecter
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Couleur de fond du bouton
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Connexion',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                // Bouton de création de compte
                OutlinedButton(
                  onPressed: () {
                    // Action pour créer un compte
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    side: BorderSide(color: Colors.black, width: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Créer un compte',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
