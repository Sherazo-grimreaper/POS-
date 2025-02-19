import 'package:flutter/material.dart';
import 'Drawer.dart'; // Import the drawer component
import 'Header.dart'; // Import the custom header component
import 'SingleProduct.dart';
import 'utils/app-constant.dart';
class ProductPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final int cartCount;
  final VoidCallback onFloatingButtonPressed;
  final Function(Map<String, dynamic>) onAddToCart;

  ProductPage({
    required this.cartItems,
    required this.cartCount,
    required this.onFloatingButtonPressed,
    required this.onAddToCart,
  });

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isGridView = true; // Toggle for grid or list view
  String searchQuery = ''; // Search query
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Use CustomHeader
            CustomHeader(
              title: 'products',
              onSearchPressed: () {
                print('Search pressed');
              },
              onFavoritePressed: () {
                print('Favorite pressed');
              },
              onDarkModeToggled: () {
                print('Dark/Light mode toggled');
              },
              isDarkMode: false,
            ),
            Expanded(
              child: Column(
                children: [
                  // Search Bar and View Toggle
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                hintText: 'Search products...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                prefixIcon: Icon(Icons.search),
                                suffixIcon: searchQuery.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          setState(() {
                                            searchQuery = '';
                                            _searchController.clear();
                                          });
                                        },
                                      )
                                    : null,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  searchQuery = value.toLowerCase();
                                });
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isGridView ? Icons.grid_view : Icons.list,
                            color: AppConstant.appMainColor,
                          ),
                          onPressed: () {
                            setState(() {
                              isGridView = !isGridView;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  // Product Grid or List View
                  Expanded(
                    child:
                        isGridView ? _buildProductGrid() : _buildProductList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(), // Use the custom drawer component
    );
  }

  Widget _buildProductGrid() {
    final filteredProducts = _getFilteredProducts();

    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return _buildProductCard(
          imageUrl: product['imageUrl'],
          title: product['title'],
          subtitle: product['subtitle'],
          price: product['price'],
        );
      },
    );
  }

  Widget _buildProductList() {
    final filteredProducts = _getFilteredProducts();

    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Image.asset(
              product['imageUrl'],
              fit: BoxFit.cover,
              width: 60,
            ),
            title: Text(product['title']),
            subtitle: Text(product['subtitle']),
            trailing: Text(
              product['price'],
              style:
                  TextStyle(color: AppConstant.appMainColor, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> _getFilteredProducts() {
    final allProducts = [
      {
        'imageUrl': 'assets/usama/dinner-set-0.jpg',
        'title': 'Dinner Set 1',
        'subtitle': '(Must choose level)',
        'price': 'PKR 50067',
      },
      {
        'imageUrl': 'assets/usama/dinner-set-1.jpg',
        'title': 'Dinner Set 2',
        'subtitle': '',
        'price': 'PKR 30099',
      },
      {
        'imageUrl': 'assets/usama/dinner-set-2.jpg',
        'title': 'Dinner Set 3',
        'subtitle': '(Must choose level)',
        'price': 'PKR 27032',
      },
      {
        'imageUrl': 'assets/usama/dinner-set-3.jpg',
        'title': 'Dinner Set 4',
        'subtitle': '',
        'price': 'PKR 34398',
      },
    ];

    if (searchQuery.isEmpty) {
      return allProducts;
    }

    return allProducts
        .where((product) =>
            product['title'] != null && // Null check added
            product['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  Widget _buildProductCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleProductPage(
              product: {
                'imageUrl': imageUrl,
                'title': title,
                'subtitle': subtitle,
                'price': price,
              },
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppConstant.appMainColor,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.all(8),
                          backgroundColor:
                              const Color.fromRGBO(156, 39, 176, 1),
                        ),
                        onPressed: () {
                          widget.onAddToCart({
                            'imageUrl': imageUrl,
                            'title': title,
                            'subtitle': subtitle,
                            'price': price,
                          });
                        },
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
