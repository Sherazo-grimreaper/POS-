import 'package:flutter/material.dart';

class SingleProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  SingleProductPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          product['title'] ?? 'Product Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  product['imageUrl'] ?? 'assets/placeholder.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              product['title'] ?? 'Unknown Product',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            if ((product['subtitle'] ?? '').isNotEmpty)
              Text(
                product['subtitle'] ?? '',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            SizedBox(height: 16),
            Text(
              product['price'] ?? 'Price not available',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add the product to the cart
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product['title']} added to cart!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
