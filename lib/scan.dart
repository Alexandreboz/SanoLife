import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final ImagePicker _picker = ImagePicker();


  Future<void> _uploadFile(File file) async {
    try {
      print('Tentative d\'envoi de fichier : ${file.path}');

      final uri = Uri.parse('http://192.168.151.244:3000/uploads'); 
      var request = http.MultipartRequest('POST', uri);


      request.fields['user_id'] = '1';

      request.files.add(await http.MultipartFile.fromPath('file', file.path));

      print('Fichier ajouté à la requête, envoi en cours...');

      var response = await request.send();

      if (response.statusCode == 200) {
        setState(() {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Fichier téléchargé avec succès'),
              backgroundColor: Colors.green,
            ),
          );
        });
        print('Fichier envoyé avec succès.');
      } else {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erreur lors du téléchargement du fichier'),
              backgroundColor: Colors.red,
            ),
          );
        });
        print('Erreur lors de l\'envoi du fichier. Statut : ${response.statusCode}');
      }
    } catch (e) {
      print('Exception attrapée : $e');
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur : $e'),
            backgroundColor: Colors.red,
          ),
        );
      });
    }
  }

  // Fonction pour ouvrir l'appareil photo
  Future<void> _openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      File file = File(photo.path);
      await _uploadFile(file);
    }
  }

  // Fonction pour charger un fichier
  Future<void> _openFilePicker() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      File selectedFile = File(file.path);
      await _uploadFile(selectedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scanner',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: _openCamera,
              child: Container(
                width: 500,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'Cliquer pour\nnumériser',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _openFilePicker,
              icon: Icon(Icons.add),
              label: Text('Charger un fichier'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
