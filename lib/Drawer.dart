import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_flutter_app/main.dart';

import 'utils/app-constant.dart'; // Replace with your actual main or login screen import

class CustomDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyApp()), // Redirect to login/home screen
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppConstant.appMainColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(color: AppConstant.appMainColor),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: AppConstant.appMainColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'M Osama',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Divider(color: Colors.transparent),
                ],
              ),
            ),

            // Drawer Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    icon: Icons.dashboard,
                    label: 'Dashboard',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.history,
                    label: 'Transaction History',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.pie_chart,
                    label: 'Report',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.shopping_cart,
                    label: 'Market Place',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.person,
                    label: 'Profile',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.support_agent,
                    label: 'Customer Care',
                    onTap: () {},
                  ),
                  Divider(color: Colors.white54), // Divider before logout

                  // Sign Out Option
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.redAccent),
                    title: Text(
                      'Sign Out',
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => _signOut(context),
                  ),
                ],
              ),
            ),

            // Footer Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.security, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Secure Connection',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Text(
                'Last Updated on 9/1/2025',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      {required IconData icon,
      required String label,
      required Function onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onTap: () => onTap(),
    );
  }
}
