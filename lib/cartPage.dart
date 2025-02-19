import 'package:flutter/material.dart';
import 'Header.dart'; // Import the custom header component
import 'base_navigation.dart';
class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Use CustomHeader
            CustomHeader(
              title: 'Cart',
              onBackPressed: () {
                Navigator.pop(context);
              },
              onSearchPressed: () {
                print('Search pressed');
              },
              onFavoritePressed: () {
                print('Favorite pressed');
              },
              onDarkModeToggled: () {
                print('Dark/Light mode toggled');
              },
              isDarkMode: false, // Replace with actual mode if necessary
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: widget.cartItems.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_basket,
                                size: 80,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Your cart is empty',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BaseNavigation()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  'Continue Shopping',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: widget.cartItems.length,
                            itemBuilder: (context, index) {
                              return _buildCartItem(index);
                            },
                          ),
                  ),
                  if (widget.cartItems.isNotEmpty) _buildCartSummary(),
                  if (widget.cartItems.isNotEmpty) _buildCheckoutButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(int index) {
    final item = widget.cartItems[index];
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item['imageUrl'] ?? 'assets/placeholder.jpg',
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'] ?? 'Unknown Title',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  if ((item['subtitle'] ?? '').isNotEmpty)
                    Text(
                      item['subtitle'],
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  SizedBox(height: 8),
                  Text(
                    'PKR ${item['price']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove, color: Colors.purple),
                        onPressed: () {
                          setState(() {
                            if ((item['quantity'] ?? 1) > 1) {
                              item['quantity'] = (item['quantity'] ?? 1) - 1;
                            } else {
                              widget.cartItems.removeAt(index);
                            }
                          });
                          _updateSummary();
                        },
                      ),
                      Text(
                        '${item['quantity'] ?? 1}',
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.purple),
                        onPressed: () {
                          setState(() {
                            item['quantity'] = (item['quantity'] ?? 1) + 1;
                          });
                          _updateSummary();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  widget.cartItems.removeAt(index);
                });
                _updateSummary();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartSummary() {
    double totalPrice = widget.cartItems.fold(0.0, (sum, item) {
      final priceString = item['price']?.replaceAll('PKR ', '') ?? '0';
      final price = double.tryParse(priceString) ?? 0.0;
      return sum + (price * (item['quantity'] ?? 1));
    });

    int totalItems = widget.cartItems.fold(0, (int sum, item) {
      final quantity = (item['quantity'] ?? 1) as int;
      return sum + quantity;
    });

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.purple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$totalItems Items',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            'Total: PKR ${totalPrice.toStringAsFixed(2)}',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle checkout action
          print('Checkout button pressed');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Checkout',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  void _updateSummary() {
    setState(() {});
  }
}
