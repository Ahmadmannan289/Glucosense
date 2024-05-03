// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_ml_custom/firebase_ml_custom.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Initialize Firebase
//     Firebase.initializeApp();
//
//     // Download the custom model
//     downloadCustomModel();
//
//     return MaterialApp(
//       title: 'Flutter Firebase Custom Model',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Firebase Custom Model'),
//         ),
//         body: Center(
//           child: Text('Downloading custom model...'),
//         ),
//       ),
//     );
//   }
//
//   void downloadCustomModel() {
//     val conditions =
//         CustomModelDownloadConditions.Builder().requireWifi().build();
//
//     FirebaseModelDownloader.getInstance()
//         .getModel("Gluco-sense", DownloadType.LOCAL_MODEL, conditions)
//         .addOnCompleteListener((task) {
//       if (task.isSuccessful) {
//         // Model downloaded successfully
//         // Depending on your app, you could enable the ML feature,
//         // or switch from the local model to the remote model, etc.
//       } else {
//         // Model download failed
//         print('Model download failed: ${task.exception}');
//       }
//     });
//   }
// }
