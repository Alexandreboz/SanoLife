import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatefulWidget {
  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5E6),
      appBar: AppBar(
        title: Text(
          'Conditions Générales d\'Utilisation',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFF7F5E6),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenue sur l\'application SanoLife. En utilisant notre application, vous acceptez d\'être lié par les présentes conditions générales d\'utilisation. Veuillez lire attentivement ces conditions avant d\'utiliser l\'application.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Utilisation de l\'Application',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'L\'application SanoLife vous offre des recommandations de santé personnalisées, un tableau de bord dynamique de santé, le suivi des activités, de la qualité du sommeil, de la nutrition et des objectifs de bien-être. En utilisant ces fonctionnalités, vous acceptez de fournir des informations précises et à jour.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Confidentialité et Sécurité',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Nous nous engageons à protéger votre vie privée et vos informations personnelles. Toutes les données collectées sont traitées conformément à notre politique de confidentialité.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
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
                    "J'accepte les conditions générales d'utilisation",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _isChecked
                    ? () {
                        // Action pour continuer après acceptation des conditions
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Couleur du bouton
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Accepter et Continuer',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
