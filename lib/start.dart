import 'package:flutter/material.dart';
import 'home_page.dart'; // Import de la page HomePage

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Image de fond
          Image.asset(
            'asset/image/1.png', // Assurez-vous que le chemin de l'image soit correct
            fit: BoxFit.cover,
          ),
          // Couche pour le texte et le bouton
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100), // Espace pour éloigner du haut de l'écran
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Texte du titre avec contour
                    Text(
                      'SanoLife',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 5.0,
                            color: Colors.white, // Couleur du contour
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Texte secondaire avec contour
                    Text(
                      'Un accompagnement personnalisé pour\nvotre parcours bien-être.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color: Colors.white, // Couleur du contour
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(), // Pousse le bouton vers le bas
              // Bouton commencer
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Redirection vers HomePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage()), // Assurez-vous que HomePage est bien défini
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Couleur du bouton
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Commencer',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }
}
