import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black, // Texte en noir
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0xFF4169e1), // Couleur bleue du header
        centerTitle: true, // Centrer le texte
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barre de recherche
              TextField(
                decoration: InputDecoration(
                  hintText: "Rechercher des sujets de santé, des articles,...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              // Section Aujourd'hui
              Text(
                "Aujourd'hui",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              _buildTodayCards(),
              SizedBox(height: 20),
              // Section des médicaments prescrits
              Text(
                "Médicaments prescrits",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              _buildMedicationGrid(),
              SizedBox(height: 20),
              // Section Un accompagnement personnalisé
              Text(
                "Un accompagnement personnalisé",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              _buildPersonalizedSupportGrid(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendrier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 0, // Index initial
        selectedItemColor: Colors.blueAccent, // Icône et texte en bleu pour l'élément sélectionné
        unselectedItemColor: Colors.black, // Icône et texte en noir pour les éléments non sélectionnés
        onTap: (int index) {
          // Gérer la navigation ici
        },
      ),
    );
  }

  // Widget pour la section Aujourd'hui
  Widget _buildTodayCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTodayItem(Icons.medical_services, "Mon traitement du jour"),
        _buildTodayItem(Icons.calendar_today, "Mon RDV du jour"),
      ],
    );
  }

  Widget _buildTodayItem(IconData icon, String label) {
    return Expanded(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 30, color: Colors.blueAccent),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pour la grille des médicaments prescrits
  Widget _buildMedicationGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildMedicationItem(Icons.medical_services, "Antalgique"),
        _buildMedicationItem(Icons.local_pharmacy, "Booster immunitaire"),
        _buildMedicationItem(Icons.healing, "Complément santé"),
      ],
    );
  }

  // Widget pour un élément de médicament
  Widget _buildMedicationItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 10),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }

  // Widget pour la grille de l'accompagnement personnalisé
  Widget _buildPersonalizedSupportGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildSupportItem(Icons.info, "Mes infos"),
        _buildSupportItem(Icons.show_chart, "Performances"),
        _buildSupportItem(Icons.lightbulb, "Conseils"),
        _buildSupportItem(Icons.explore, "Découvrir +"),
      ],
    );
  }

  // Widget pour un élément de l'accompagnement personnalisé
  Widget _buildSupportItem(IconData icon, String label) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.black),
          SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
