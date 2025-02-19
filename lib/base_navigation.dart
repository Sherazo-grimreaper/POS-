import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as custom_badge;
import 'profile.dart';
import 'cartPage.dart';
import 'ProductScreen.dart';
import 'Home.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class BaseNavigation extends StatefulWidget {
  @override
  _BaseNavigationState createState() => _BaseNavigationState();
}

class _BaseNavigationState extends State<BaseNavigation> {
  int _selectedIndex = 0;
  int cartCount = 0;
  List<Map<String, dynamic>> cartItems = [];

  final List<IconData> _iconList = [
    Icons.home,
    Icons.shopping_bag,
    Icons.person,
  ];

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(onAddToCart: _addToCart), // Pass the callback to HomePage
      ProductPage(
        cartCount: cartCount, // Pass the current cart count
        onFloatingButtonPressed:
            _navigateToCart, // Callback to navigate to cart
        onAddToCart: _addToCart,
        cartItems: [], // Callback to add items to the cart
      ),
      ProfilePage(),
    ];
  }

  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      cartItems.add(product);
      cartCount++;
    });
  }

  void _navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartItems: cartItems),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: custom_badge.Badge(
        position: custom_badge.BadgePosition.topEnd(top: -5, end: -5),
        badgeContent: Text(
          cartCount.toString(),
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        showBadge: cartCount > 0,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: _navigateToCart,
          child: Icon(Icons.shopping_cart, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.end,
        activeColor: Colors.purple,
        inactiveColor: Colors.grey,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: _onItemTapped,
      ),
    );
  }
}
