import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        title: Text(
          'Tableau de bord',
          style: TextStyle(
            color: Colors.white, // Texte en blanc
          ),
        ),
        backgroundColor: Color(0xFF4169e1), // Utilisation de la couleur #4169e1
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
              
              // Section d'accompagnement personnalisé
              Text(
                "Un accompagnement personnalisé",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              _buildConsultationCard(
                Icons.person,
                "Aperçu de la consultation",
                "Book Now",
              ),
              SizedBox(height: 10),
              _buildConsultationCard(
                Icons.favorite,
                "Heart health assessment",
                "Schedule",
              ),
              SizedBox(height: 20),
              
              // Section des médicaments prescrits
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Médicaments prescrits",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildMedicationGrid(),
              SizedBox(height: 20),
              
              // Section pour se connecter avec un partenaire
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Connectez-vous avec votre partenaire",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Tout explorer",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildPartnerGrid(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Médicaments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 0, // Index initial
        selectedItemColor: Colors.blueAccent,
        onTap: (int index) {
          // Gérer la navigation ici
        },
      ),
    );
  }

  // Widget pour les cartes d'accompagnement personnalisé
  Widget _buildConsultationCard(IconData icon, String title, String actionText) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 30),
                SizedBox(width: 10),
                Text(title),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(actionText),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Couleur du bouton
              ),
            ),
          ],
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

  // Widget pour la grille des partenaires
  Widget _buildPartnerGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildPartnerItem(Icons.local_hospital, "Primary care"),
        _buildPartnerItem(Icons.health_and_safety, "Oral health"),
        _buildPartnerItem(Icons.science, "Research"),
        _buildPartnerItem(Icons.local_hospital, "Caregiver"),
        _buildPartnerItem(Icons.restaurant, "Nutrition"),
        _buildPartnerItem(Icons.favorite, "Tableau de bord"),
      ],
    );
  }

  // Widget pour un élément de partenaire
  Widget _buildPartnerItem(IconData icon, String label) {
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
}
