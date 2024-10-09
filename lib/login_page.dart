import 'package:flutter/material.dart';
import 'signup_page.dart'; // Assurez-vous que le chemin du fichier est correct
import 'tableau_de_bord.dart'; // Import de la page tableau de bord

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Variables pour capturer l'email et le mot de passe
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Méthode pour simuler la connexion
  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Ici, tu peux ajouter la logique d'authentification (vérification avec une API par exemple)
    // Pour l'exemple, on va simplement vérifier si les champs ne sont pas vides
    if (email.isNotEmpty && password.isNotEmpty) {
      // Redirection vers la page tableau de bord après connexion réussie
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      // Afficher une erreur si les champs sont vides
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Veuillez entrer une adresse mail et un mot de passe.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5E6), // Couleur de fond
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  // Affichage du logo
                  Image.asset(
                    'asset/image/sano_life.png',  // Chemin de l'image du logo
                    height: 300.0,
                  ),
                  SizedBox(height: 0),
                  // Texte sous le logo
                  Text(
                    'Votre voyage vers une vie plus saine',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  // Champ Adresse mail
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Adresse mail',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  // Champ Mot de passe
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  // Bouton Se connecter
                  ElevatedButton(
                    onPressed: _login, // Appel à la fonction de connexion
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Couleur du bouton
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Se connecter',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Bouton Créer mon compte
                  OutlinedButton(
                    onPressed: () {
                      // Redirection vers la page d'inscription
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      side: BorderSide(color: Colors.black, width: 2.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Créer mon compte',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Lien Mot de passe oublié
                  TextButton(
                    onPressed: () {
                      // Logique de mot de passe oublié
                    },
                    child: Text(
                      'Mot de passe oublié',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
