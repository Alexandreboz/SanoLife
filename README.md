# SanoLife

Description
L'application SanoLife est une application mobile développée en Flutter. Elle permet aux utilisateurs de gérer leurs documents de santé, de recevoir des conseils personnalisés, de suivre leurs habitudes de vie et bien plus. L'application interagit avec une API Node.js pour stocker et récupérer les documents médicaux et les données des utilisateurs.

Prérequis
Flutter (version >= 2.0)
Un appareil ou un émulateur Android ou iOS configuré
Installation
Clonez ce dépôt :

bash
Copier le code
git clone https://github.com/username/sanolife-flutter.git
Installez les dépendances : Dans le répertoire de l'application Flutter, exécutez :

bash
Copier le code
flutter pub get
Configurez l'API : Modifiez l'URL de l'API dans les fichiers de services pour pointer vers l'API backend Node.js. Exemple dans documents.dart :

dart
Copier le code
final uri = Uri.parse('http://192.168.x.x:3000/uploads'); // Remplacez par l'URL de votre API
Lancez l'application :

bash
Copier le code
flutter run
Assurez-vous que votre appareil ou émulateur est configuré et prêt à recevoir l'application.

Fonctionnalités principales
1. Gestion des documents de santé
Upload et visualisation des documents via l'API Node.js.
2. Système de notifications
Rappel de prise de médicaments, notifications de conseils.
3. Gestion des profils
Mise à jour des informations utilisateurs.
Pages importantes
1. Page de Dashboard
Accueil de l'utilisateur avec accès rapide aux documents, traitements, et conseils.
2. Page de Scan
Permet de télécharger des documents en prenant une photo ou en sélectionnant un fichier.
3. Page de Mentions Légales et Conditions Générales
L'utilisateur doit accepter les conditions et les mentions légales avant de créer un compte.
Technologies utilisées
Flutter pour l'application mobile
Dart pour la logique
http pour les requêtes réseau
Provider (si utilisé) pour la gestion d'état
