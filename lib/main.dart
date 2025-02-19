import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_flutter_app/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDL80NLQ8QchGdjKFMDlEcNc180rqxaIXs",
      authDomain: "flutter-pos-7d4e2.firebaseapp.com",
      projectId: "flutter-pos-7d4e2",
      storageBucket: "flutter-pos-7d4e2.appspot.com",
      messagingSenderId: "799087638440",
      appId: "1:799087638440:web:b68d5f3df4f9f519dc4f9d",
      measurementId: "G-2ZHGGMJSST",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Navigation',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: WelcomeScreen(),
    );
  }
}
