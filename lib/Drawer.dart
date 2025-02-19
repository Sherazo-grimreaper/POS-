import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.purple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 50, color: Colors.purple),
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
                    Divider(
                      color: Colors.transparent,
                      
                    ),
                  ],
                ),
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
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.history,
                    label: 'Transaction History',
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.pie_chart,
                    label: 'Report',
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.shopping_cart,
                    label: 'Market Place',
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.person,
                    label: 'Profile',
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.support_agent,
                    label: 'Customer Care',
                    onTap: () {
                      // Handle navigation
                    },
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
