import 'package:flutter/material.dart';

class LegalMentionsPage extends StatefulWidget {
  @override
  _LegalMentionsPageState createState() => _LegalMentionsPageState();
}

class _LegalMentionsPageState extends State<LegalMentionsPage> {
  bool isAccepted = false; // Pour gérer l'état de la case à cocher

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mentions Légales',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0xFFF7F5E6),
        centerTitle: true,
        leading: Icon(Icons.security, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bienvenue sur l'application SanoLife. Nous prenons très au sérieux la protection de vos données personnelles et nous conformons aux réglementations RGPD pour assurer leur sécurité. Voici comment nous utilisons et protégeons vos informations.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Traitement des Données",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "SanoLife collecte et traite vos données afin de fournir des recommandations personnalisées en matière de santé. Toutes les informations sont stockées en toute sécurité et ne sont partagées qu'avec votre consentement.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Vos Droits",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Vous avez le droit d'accéder à vos données, de les rectifier ou de les supprimer. Pour toute demande, veuillez nous contacter via l'application.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Contact",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Pour toute question relative à la protection des données, vous pouvez nous contacter à l'adresse suivante : ",
                style: TextStyle(fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  // Logique pour ouvrir une adresse mail, un navigateur ou une autre action
                },
                child: Text(
                  "support@sanolife.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Checkbox(
                    value: isAccepted,
                    onChanged: (bool? value) {
                      setState(() {
                        isAccepted = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "J'accepte les conditions générales et la politique de confidentialité.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: isAccepted
                    ? () {
                        // Logique pour continuer après acceptation des conditions
                        Navigator.pushNamed(context, '/home'); // Ex. rediriger vers la page d'accueil
                      }
                    : null, // Désactiver le bouton si non accepté
                child: Text('Accepter et Continuer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAccepted ? Colors.blue : Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
