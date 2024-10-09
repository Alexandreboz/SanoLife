import 'package:flutter/material.dart';
import 'package:sano_life/scan.dart';
import 'package:sano_life/traitement.dart'; // Import de la page traitement

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0xFFF7F5E6),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFF7F5E6),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Text(
                  "Aujourd'hui",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                _buildTodayCards(context), // Ajout du contexte pour la navigation
                SizedBox(height: 20),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_as_pdf),
            label: 'Scan',
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
        currentIndex: 0,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
        onTap: (int index) {
          if (index == 2) {
            // Redirige vers la page de scan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScanPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildTodayCards(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Ajout de la redirection vers "TraitementPage" pour "Mon traitement du jour"
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TreatmentPage()),
              );
            },
            child: _buildTodayItem(Icons.medical_services, "Mon traitement du jour"),
          ),
        ),
        SizedBox(width: 10),
        Expanded(child: _buildTodayItem(Icons.calendar_today, "Mon RDV du jour")),
      ],
    );
  }

  Widget _buildTodayItem(IconData icon, String label) {
    return Card(
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
            Flexible(
              child: Text(
                label,
                style: TextStyle(fontSize: 16, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicationGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildMedicationItem(Icons.medical_services, "Antalgique", Color(0xFF56C8A2)),
        _buildMedicationItem(Icons.local_pharmacy, "Booster\nimmunitaire", Color(0xFFFFC898)),
        _buildMedicationItem(Icons.healing, "Complément\nsanté", Color(0xFFB39CD0)),
      ],
    );
  }

  Widget _buildMedicationItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 30, color: color),
        ),
        SizedBox(height: 7),
        Flexible(
          child: Text(
            label,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

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
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
