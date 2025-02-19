import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'base_navigation.dart';
import 'utils/app-constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Navigate to home screen upon successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BaseNavigation()),
      );
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(e.message ?? "Invalid email or password.");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Login Failed"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppConstant.appMainColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30), // For top spacing

            // Back Button and Heading
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondaryColor, // Purple background
                    borderRadius: BorderRadius.circular(5), // Rounded shape
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppConstant.appSecondaryColor, // White icon
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Navigate to the previous screen
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppConstant.appSecondaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Email or Phone Field
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email or Phone Number',
                labelStyle: TextStyle(color: AppConstant.appSecondaryColor),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Password Field
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: '8 Characters minimum',
                hintStyle: TextStyle(color: AppConstant.appSecondaryColor),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 30),

            // Login Button
            Center(
              child: SizedBox(
                width: double.infinity, // Makes the button full width
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    backgroundColor: AppConstant.appMainColor,
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  onPressed: isLoading ? null : _login,
                  child: isLoading
                      ? CircularProgressIndicator(color: AppConstant.appSecondaryColor)
                      : Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppConstant.appSecondaryColor,
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Forgot Password Link
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle forgot password action
                },
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                      color: AppConstant.appMainColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
