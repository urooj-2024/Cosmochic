import 'package:flutter/material.dart';

import 'cart_screen.dart';

class LipBalmScreen extends StatelessWidget {
  const LipBalmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lipBalms = [
      {'image': 'assets/balm_cherry.png', 'name': 'Cherry Balm', 'price': 'PKR 500'},
      {'image': 'assets/balm_peach.png', 'name': 'Peach Balm', 'price': 'PKR 600'},
      {'image': 'assets/balm_mint.png', 'name': 'Mint Balm', 'price': 'PKR 450'},
      {'image': 'assets/balm_strawberry.png', 'name': 'Strawberry Balm', 'price': 'PKR 550'},
      {'image': 'assets/balm_coconut.png', 'name': 'Coconut Balm', 'price': 'PKR 700'},
    ];

    return ProductGridScreen(title: 'Lip Balms', products: lipBalms);
  }
}

class ProductGridScreen extends StatelessWidget {
  final String title;
  final List<Map<String, String>> products;

  const ProductGridScreen({required this.title, required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.pink[50],
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9, // Adjust aspect ratio for better look
          ),
          itemCount: products.length,
          itemBuilder: (ctx, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9), // Semi-transparent background
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      product['image']!,
                      height: 155, // Increased image size for a more prominent display
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      product['name']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product['price']!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          Cart.addToCart(product['name']!, product['price']!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${product['name']} added to cart!')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[100],
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      )
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
      home: LipBalmScreen(),
      debugShowCheckedModeBanner: false, // Disable the debug banner
     ));
}
