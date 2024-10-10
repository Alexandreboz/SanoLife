import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DocumentsPage extends StatefulWidget {
  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  List<dynamic> documents = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDocuments();
  }


  Future<void> fetchDocuments() async {
    final uri = Uri.parse('http://192.168.151.244:3000/uploads'); 
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        setState(() {
          documents = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Erreur lors de la récupération des fichiers');
      }
    } catch (e) {
      print('Erreur: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Documents',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0xFFF7F5E6),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Affiche un loader pendant le chargement
          : documents.isEmpty
              ? Center(child: Text('Aucun fichier disponible.')) // Si aucun fichier n'est trouvé
              : ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text('Fichier envoyé le ${document['created_at']}'),
                        // Affichage de l'image au lieu de l'URL
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            // Afficher l'image à partir de l'URL
                            Image.network(
                              document['url'],
                              height: 200, // Ajustez la hauteur selon vos besoins
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Text("Impossible de charger l'image");
                              },
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
