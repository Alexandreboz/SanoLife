import 'package:flutter/material.dart';
import 'legal_mention.dart';
import 'condition.dart'; // Page des conditions générales
import 'login_page.dart'; // Page de connexion

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Variables pour les champs du formulaire
  bool _isCheckedConditions = false;
  bool _isCheckedMentions = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
                      'asset/image/sano_life2.png', // Chemin du logo
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Adresse mail',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // Champ Mot de passe
                    TextField(
                      controller: _passwordController,
                      obscureText: true, // Masquer le mot de passe
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Champ Confirmer le mot de passe
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true, // Masquer le mot de passe
                      decoration: InputDecoration(
                        labelText: 'Confirmer le mot de passe',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Checkbox pour les conditions générales avec lien
                    Row(
                      children: [
                        Checkbox(
                          value: _isCheckedConditions,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedConditions = value ?? false;
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            // Rediriger vers la page des Conditions Générales
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TermsAndConditionsPage()), // Page des Conditions
                            );
                          },
                          child: Text(
                            "J'accepte les conditions générales.",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Checkbox pour les mentions légales avec redirection
                    Row(
                      children: [
                        Checkbox(
                          value: _isCheckedMentions,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedMentions = value ?? false;
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            // Rediriger vers la page des Mentions Légales
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LegalMentionsPage()), // Page des Mentions Légales
                            );
                          },
                          child: Text(
                            "J'accepte les mentions légales.",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Bouton pour créer le compte
                    Center(
                      child: ElevatedButton(
                        onPressed: (_isCheckedConditions && _isCheckedMentions)
                            ? () {
                                // Vérifier si le mot de passe et la confirmation correspondent
                                if (_passwordController.text == _confirmPasswordController.text) {
                                  // Rediriger vers la page de login avec un message de succès
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Compte créé avec succès !'),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()), // Page de connexion
                                  );
                                } else {
                                  // Afficher un message d'erreur si les mots de passe ne correspondent pas
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Les mots de passe ne correspondent pas.'),
                                    ),
                                  );
                                }
                              }
                            : null, // Désactiver le bouton si les conditions ou les mentions ne sont pas cochées
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
