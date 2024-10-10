import 'package:flutter/material.dart';
import 'tableau_de_bord.dart'; // Assurez-vous d'importer correctement cette page
import 'login_page.dart'; // Importer la page de connexion
import 'start.dart'; // Importer la page de démarrage

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController(text: 'Bozzo');
  final TextEditingController firstNameController = TextEditingController(text: 'Alexandre');
  final TextEditingController addressController = TextEditingController(text: 'Montpellier');
  final TextEditingController phoneController = TextEditingController(text: '007');
  final TextEditingController emailController = TextEditingController(text: 'alexandre@gmail.com');
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Navigation vers la page tableau de bord après modifications
  void _saveChanges() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage())); // Remplacez par tableau_de_bord.dart
  }

  // Navigation vers la page de connexion
  void _navigateToLoginPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())); // Remplacez par login.dart
  }

  // Navigation vers la page de démarrage
  void _navigateToWelcomePage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage())); // Remplacez par start.dart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Profil'),
        centerTitle: true,
        backgroundColor: Color(0xFFF7F5E6),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Nom", nameController),
              _buildTextField("Prénom", firstNameController),
              _buildTextField("Adresse", addressController),
              _buildTextField("Téléphone", phoneController),
              _buildTextField("E-mail", emailController),
              _buildTextField("Mot de passe actuel", currentPasswordController, obscureText: true),
              _buildTextField("Nouveau mot de passe", newPasswordController, obscureText: true),
              _buildTextField("Confirmer le mot de passe", confirmPasswordController, obscureText: true),
              SizedBox(height: 20),
              _buildSaveButton(),
              SizedBox(height: 10),
              _buildLogoutButton(),
              SizedBox(height: 10),
              _buildDeleteAccountButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _saveChanges,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Center(
        child: Text(
          "Enregistrer mes modifications",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return ElevatedButton(
      onPressed: _navigateToLoginPage,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Center(
        child: Text(
          "Déconnexion",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDeleteAccountButton() {
    return ElevatedButton(
      onPressed: _navigateToWelcomePage,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Center(
        child: Text(
          "Supprimer mon compte",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
