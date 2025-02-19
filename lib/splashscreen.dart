import 'package:flutter/material.dart';
import 'Onboardingone.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body:  SingleChildScrollView(
        child: Padding(
              padding: const EdgeInsets.only(top: 20.0,right:20.0,left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // App Title
            Padding(
              padding: const EdgeInsets.only(top: 20.0,right:5.0,left: 5.0),
              child: Text(
                'NESTCRAFT',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
            
            // Image and Caption
            Column(
              children: [
                // Illustration
                Image.asset(
                  'assets/usama/usama.png', // Add your image asset here
                  height: 300,
                  fit: BoxFit.contain,
                ),
                
                SizedBox(height: 20),
                
                // Caption
                Text(
                  'Easy Management.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                
                SizedBox(height: 20),
                
                // Progress Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildProgressDot(isActive: true),
                    SizedBox(width: 10),
                    _buildProgressDot(isActive: false),
                    SizedBox(width: 10),
                    _buildProgressDot(isActive: false),
                  ],
                ),
              ],
            ),

             SizedBox(height: 80),
            
            // Welcome Button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child:  SizedBox(
               width: double.infinity, // Makes the button full width
          child: ElevatedButton(
      
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Onboardingone()),
                    );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.purple),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    
                    color: Colors.purple,
                  ),
                ),
              ),
          ),
              ),
            
          ],
        ),
        ),
      ),
    );
  }

  // Method to build progress dots
  Widget _buildProgressDot({required bool isActive}) {
    return Container(
      width: 40,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.purple : Colors.grey.shade300,
        shape: BoxShape.rectangle,
      ),
    );
  }
}
