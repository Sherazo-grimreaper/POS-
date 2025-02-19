import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'ProductScreen.dart';
import 'base_navigation.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    color: Colors.purple, // Purple background
                    borderRadius: BorderRadius.circular(5), // Rounded shape
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white, // White icon
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
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Email or Phone Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email or Phone Number',
                labelStyle: TextStyle(color: Colors.grey),
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
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: '8 Characters minimum',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Verify OTP Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Verify OTP',
                hintText: 'Enter OTP sent to your phone',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 30),

            Text(
              'Send an OTP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOptionButton('Email', Icons.email),
                _buildWhatsAppButton(), // Custom WhatsApp button
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOptionButton('SMS', Icons.message),
                _buildOptionButton('Missed call', Icons.call),
              ],
            ),
            SizedBox(height: 80),

            // Login Button
            Center(
              child: SizedBox(
                width: double.infinity, // Makes the button full width
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(
                        vertical:
                            30), // Remove horizontal padding for full width
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BaseNavigation()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                      color: Colors.purple,
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

  Widget _buildOptionButton(String text, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      onPressed: () {
        // Handle button click
      },
      icon: Icon(icon, color: Colors.purple),
      label: Text(
        text,
        style: TextStyle(color: Colors.purple),
      ),
    );
  }

  // Custom WhatsApp button with SVG icon
  Widget _buildWhatsAppButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      onPressed: () {
        // Handle WhatsApp button click
      },
      icon: WhatsAppIcon(iconColor: Colors.purple), // Custom WhatsAppIcon
      label: Text(
        'WhatsApp',
        style: TextStyle(color: Colors.purple),
      ),
    );
  }
}

class WhatsAppIcon extends StatelessWidget {
  final Color iconColor;

  WhatsAppIcon({required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/usama/icons/whatsapp.svg',
      // color: iconColor, // Dynamically set the icon color
      width: 30, // Icon width
      height: 30, // Icon height
    );
  }
}
