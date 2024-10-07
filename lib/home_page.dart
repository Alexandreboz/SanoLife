import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import pour accéder à la caméra
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

// Modèle pour un utilisateur
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }
}

// Page pour afficher la liste des utilisateurs
class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('http://localhost:3000/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        users = data.map((json) => User.fromJson(json)).toList();
      });
    } else {
      throw Exception('Erreur lors du chargement des utilisateurs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des utilisateurs'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].email),
          );
        },
      ),
    );
  }
}

// Page d'accueil avec le lien vers la liste des utilisateurs
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final ImagePicker _picker = ImagePicker(); // Pour ouvrir la caméra

  // Exemple de liste de médicaments
  List<Map<String, String>> medications = [
    {'time': '08:00', 'name': 'Doliprane', 'dose': 'Prendre 1 Pilule(s)'},
    {'time': '20:00', 'name': 'Doliprane', 'dose': 'Prendre 1 Pilule(s)'},
  ];

  // Ouvrir la caméra pour capturer l'image
  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Enregistrer l'image dans la base de données
      await _uploadImageToServer(File(image.path));
    }
  }

  // Fonction pour envoyer l'image au serveur et l'enregistrer
  Future<void> _uploadImageToServer(File imageFile) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://localhost:3000/upload-ordonnance'), // URL pour l'envoi
    );
    request.files.add(
      await http.MultipartFile.fromPath('image', imageFile.path),
    );
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image envoyée avec succès');
    } else {
      print('Erreur lors de l\'envoi de l\'image');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Si l'utilisateur clique sur Ordonnance (index 1), ouvrir la caméra
    if (index == 1) {
      _openCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            SizedBox(width: 10),
            Text('Invité'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Action pour les notifications
            },
          ),
        ],
      ),
      // Ajout du Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Invité"),
              accountEmail: Text("Créer le profil"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(
                  Icons.person,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline, color: Colors.green),
              title: Text("Ajouter une personne à charge"),
              onTap: () {
                // Action pour ajouter une personne à charge
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add_alt_1, color: Colors.green),
              title: Text("Inviter un Medfriend"),
              onTap: () {
                // Action pour inviter un Medfriend
              },
            ),
            ListTile(
              leading: Icon(Icons.qr_code, color: Colors.blue),
              title: Text("Code de validation"),
              onTap: () {
                // Action pour le code de validation
              },
            ),
            ListTile(
              leading: Icon(Icons.login, color: Colors.blue),
              title: Text("Se connecter"),
              onTap: () {
                // Action pour la connexion
              },
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.blue),
              title: Text("Voir les utilisateurs"),
              onTap: () {
                // Navigation vers la page des utilisateurs
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsersPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aujourd\'hui, 7 oct.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Barre de navigation des jours
                    Row(
                      children: List.generate(7, (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Text(
                                'lun.',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${7 + index}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: medications.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.circle_outlined),
                    title: Text(medications[index]['name']!),
                    subtitle: Text(medications[index]['dose']!),
                    trailing: Text(
                      medications[index]['time']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action pour ajouter un médicament
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Couleur bleue pour tout le footer
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Ordonnance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendrier',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white, // Couleur des icônes et textes sélectionnés
        unselectedItemColor: Colors.white54, // Couleur des icônes non sélectionnés
        onTap: _onItemTapped, // Gérer le tap sur les boutons
      ),
    );
  }
}
