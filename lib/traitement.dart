import 'package:flutter/material.dart';

class TreatmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Traitements',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0xFFF7F5E6),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Notification
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(Icons.notifications, color: Colors.black),
                  title: Text(
                    "N'oubliez pas de prendre votre médicament",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.warning, color: Colors.red),
                ),
              ),
              SizedBox(height: 20),
              // Titre Rappel
              Text(
                'Rappel de mon traitement',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              // Tableau de rappel de traitement
              Table(
                border: TableBorder.all(color: Colors.grey),
                children: [
                  _buildTableRowWithText('Jour', 'Matin', 'Midi', 'Soir'), // En-têtes de texte
                  _buildTableRowWithIcons('Lundi', Icons.local_pharmacy,
                      Icons.local_pharmacy, Icons.local_pharmacy, context),
                  _buildTableRowWithIcons('Mardi', Icons.local_pharmacy,
                      Icons.local_pharmacy, Icons.local_pharmacy, context),
                  _buildTableRowWithIcons('Mercredi', Icons.local_pharmacy,
                      Icons.local_pharmacy, Icons.local_pharmacy, context),
                  _buildTableRowWithIcons('Jeudi', Icons.local_pharmacy,
                      Icons.local_pharmacy, Icons.local_pharmacy, context),
                  _buildTableRowWithIcons('Vendredi', Icons.local_pharmacy,
                      Icons.local_pharmacy, Icons.local_pharmacy, context),
                  _buildTableRowWithIcons(
                      'Samedi', Icons.local_pharmacy, Icons.local_pharmacy, null, context),
                  _buildTableRowWithIcons('Dimanche', Icons.local_pharmacy, null, null, context),
                ],
              ),
              SizedBox(height: 20),
              // Bouton ajouter un rappel
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Action pour ajouter un rappel
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Couleur du bouton
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Ajouter un Rappel',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
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
        currentIndex: 0,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
      ),
    );
  }

  // Construire une ligne du tableau avec des icônes Flutter
  TableRow _buildTableRowWithIcons(
      String day, IconData? morning, IconData? noon, IconData? night, BuildContext context) {
    return TableRow(
      children: [
        _buildTableCell(day, isHeader: false),
        _buildIconCell(morning, 'Matin', TimeOfDay(hour: 9, minute: 0), context),
        _buildIconCell(noon, 'Midi', TimeOfDay(hour: 12, minute: 0), context),
        _buildIconCell(night, 'Soir', TimeOfDay(hour: 20, minute: 0), context),
      ],
    );
  }

  // Construire une ligne du tableau avec du texte (en-tête)
  TableRow _buildTableRowWithText(String day, String morning, String noon, String night) {
    return TableRow(
      children: [
        _buildTableCell(day, isHeader: true),
        _buildTableCell(morning, isHeader: true),
        _buildTableCell(noon, isHeader: true),
        _buildTableCell(night, isHeader: true),
      ],
    );
  }

  // Construire une cellule de texte pour le tableau
  Widget _buildTableCell(String value, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        value,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 16 : 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Construire une cellule d'icône pour le tableau
  Widget _buildIconCell(IconData? icon, String period, TimeOfDay initialTime, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: icon != null
          ? GestureDetector(
              onTap: () {
                _showTimePicker(context, period, initialTime);
              },
              child: Icon(
                icon,
                size: 20,
                color: Colors.blueAccent,
              ),
            )
          : SizedBox.shrink(), // Si l'icône est null, on laisse la cellule vide
    );
  }

  Future<void> _showTimePicker(BuildContext context, String period, TimeOfDay initialTime) async {
    TimeOfDay? newTime = await showDialog<TimeOfDay>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Modifier l'heure pour $period",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TimePickerDialog(
                  initialTime: initialTime,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Annuler", style: TextStyle(color: Colors.blueAccent)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, initialTime);
                        },
                        child: Text("Valider", style: TextStyle(color: Colors.blueAccent)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );

    if (newTime != null && newTime != initialTime) {
      // Logique pour enregistrer la nouvelle heure sélectionnée
      print("Nouvelle heure pour $period : ${newTime.format(context)}");
    }
  }
}