import 'package:flutter/material.dart';
import 'package:my_flutter_app/splashscreen.dart';
// import 'base_navigation.dart'; // Import the base_navigation.dart file

void main() {
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
      home: WelcomeScreen(), // Set BaseNavigation as the home
    );
  }
}
