import 'package:flutter/material.dart';
import 'Signup.dart';
import 'Login.dart';
class Onboardingone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back Button
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.purple, // Purple background
                      borderRadius: BorderRadius.circular(5), // Rounded shape
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white, // White icon
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 20), // Space between back arrow and heading
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Subtitle
              Text(
                'Welcome to NestCraft! Continue by Login or creating account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Illustration Image
              Center(
                child: Image.asset(
                  'usama/onboardingone.png', // Replace with your actual image path
                  height: 250, // Adjust image size as needed
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 40), // Additional space below the image

              // Login Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to LoginPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen(), // Use your actual LoginPage widget
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF800080), // Purple background
                    padding:
                        EdgeInsets.symmetric(vertical: 25), // Increased height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center content
                    children: [
                      Icon(Icons.login, color: Colors.white), // Icon
                      SizedBox(width: 10),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White text
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30), // Increased space between buttons

              // OR Text
              Center(
                child: Text(
                  'Or',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              SizedBox(height: 30), // Increased space

              // Create New Account Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to SignupPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SignupPage(), // Use your actual SignupPage widget
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF800080), // Purple background
                    padding:
                        EdgeInsets.symmetric(vertical: 25), // Increased height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center content
                    children: [
                      Icon(Icons.person_add, color: Colors.white), // Icon
                      SizedBox(width: 10),
                      Text(
                        'Create a new account',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White text
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
