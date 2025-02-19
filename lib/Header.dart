import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onDarkModeToggled;
  final bool isDarkMode;

  CustomHeader({
    required this.title,
    this.onBackPressed,
    this.onSearchPressed,
    this.onFavoritePressed,
    required this.onDarkModeToggled,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Menu Icon to open Drawer
          IconButton(
            icon: Icon(Icons.menu, color: Colors.purple),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          SizedBox(width: 10),

          // Title
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: 'Search for $title...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onTap: onSearchPressed,
            ),
          ),
          SizedBox(width: 10),

          // Favorite Button
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.purple),
            onPressed: onFavoritePressed,
          ),

          // Dark Mode Toggle Button
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: Colors.purple,
            ),
            onPressed: onDarkModeToggled,
          ),
        ],
      ),
    );
  }
}
