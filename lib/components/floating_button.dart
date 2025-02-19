// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart' as custom_badge;

// class CustomFloatingButton extends StatelessWidget {
//   final int cartCount;
//   final VoidCallback onPressed;

//   CustomFloatingButton({
//     required this.cartCount,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return custom_badge.Badge(
//       position: custom_badge.BadgePosition.topEnd(top: -5, end: -5),
//       badgeContent: Text(
//         cartCount.toString(),
//         style: TextStyle(color: Colors.white, fontSize: 12),
//       ),
//       showBadge: cartCount > 0,
//       child: FloatingActionButton(
//         backgroundColor: Colors.purple,
//         onPressed: onPressed,
//         child: Icon(Icons.shopping_cart, color: Colors.white),
//       ),
//     );
//   }
// }
