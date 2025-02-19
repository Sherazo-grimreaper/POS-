import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Header.dart';
import 'Drawer.dart';
import 'SingleProduct.dart';

class HomePage extends StatelessWidget {
  final Function(Map<String, dynamic>) onAddToCart;

  HomePage({required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(), // Add the custom drawer
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Use CustomHeader
              CustomHeader(
                title: 'products',
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
                isDarkMode: false, // Pass the appropriate mode
              ),
              // Banner Carousel
              CarouselSlider(
                items: [
                  _buildBannerItem('assets/images/banner1.jpg'),
                  _buildBannerItem('assets/images/banner2.jpg'),
                  _buildBannerItem('assets/images/banner3.jpg'),
                ],
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
              ),
              SizedBox(height: 20),

              // Categories Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
              SizedBox(height: 10),
              _buildCategories(),

              // All Products Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text(
                  'All Products',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
              _buildProductGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBannerItem(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  Widget _buildCategories() {
    final categories = ['Switches', 'Breakers', 'Sheets', 'Wires', 'Lights'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: CarouselSlider(
        items: categories.map((category) {
          return Container(
            width: 100, // Ensure consistent width for items
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.purple),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.purple.withOpacity(0.2),
                  child: Icon(Icons.category, color: Colors.purple),
                ),
                SizedBox(height: 8),
                Flexible(
                  child: Text(
                    category,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 150, // Adjust carousel height
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          viewportFraction: 0.4,
          scrollPhysics: BouncingScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 6, // Number of products
      itemBuilder: (context, index) {
        return _buildProductCard(
          context: context, // Pass context here
          imageUrl: 'assets/images/product-$index.jpg',
          title: 'Product ${index + 1}',
          price: 'PKR ${[2000, 2500, 3000, 3500, 4000, 4500][index]}',
        );
      },
    );
  }


  Widget _buildProductCard({
    required BuildContext context, // Add BuildContext as a parameter
    required String imageUrl,
    required String title,
    required String price,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, // Use the passed context here
          MaterialPageRoute(
            builder: (context) => SingleProductPage(
              product: {
                'imageUrl': imageUrl,
                'title': title,
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
                height: 120,
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
                  Text(
                    price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
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
