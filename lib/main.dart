import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:flutter/material.dart';
import 'package:glucosense/screens/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDKrJNYgpiETyf8PvZGThahI7hoSLjr_Co",
        appId: "1:448543752473:android:c3cb671cff5b28a0b24588",
        messagingSenderId: "448543752473",
        projectId: "signin-glucosense",
        storageBucket: 'signin-glucosense.appspot.com'),
  );

  // Define the model name and version you want to download
  String modelName = "Gluco-sense";

  // Define the download conditions
  FirebaseModelDownloadConditions conditions = FirebaseModelDownloadConditions(
    androidWifiRequired: true,
    iosAllowsCellularAccess: true,
  );

  // Start downloading the model
  FirebaseModelDownloader downloader = FirebaseModelDownloader.instance;

  FirebaseModelDownloadType downloadType =
      FirebaseModelDownloadType.latestModel;
  try {
    FirebaseCustomModel customModel = await downloader.getModel(
      modelName,
      downloadType,
      conditions,
    );
    // Model downloaded successfully
    print("Model downloaded: $modelName");
  } catch (e) {
    // Error occurred during download
    print("Error downloading model: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const signInScreen(),
    );
  }
}
