import 'package:flutter/material.dart';

import 'cart_screen.dart';

class LipstickScreen extends StatelessWidget {
  const LipstickScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lipsticks = [
      {'image': 'assets/nude_peach.png', 'name': 'Nude Peach', 'price': 'PKR 1,200'},
      {'image': 'assets/nude_pink.png', 'name': 'Nude Pink', 'price': 'PKR 1,300'},
      {'image': 'assets/nude_brown.png', 'name': 'Nude Brown', 'price': 'PKR 1,500'},
      {'image': 'assets/nude_beige.png', 'name': 'Nude Beige', 'price': 'PKR 1,400'},
      {'image': 'assets/nude_mauve.png', 'name': 'Nude Mauve', 'price': 'PKR 1,600'},
      {'image': 'assets/nude_rose.png', 'name': 'Nude Rose', 'price': 'PKR 1,800'},
      {'image': 'assets/nude_caramel.png', 'name': 'Nude Caramel', 'price': 'PKR 1,200'},
    ];

    return ProductGridScreen(title: 'Nude Lipsticks', products: lipsticks);
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
            crossAxisCount: 2, // 2 boxes per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9, // Adjust the aspect ratio for the height
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
                  // Product Image
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      product['image']!,
                      height: 155, // Increased the size of the image
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Product Name
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
                  // Product Price
                  Text(
                    product['price']!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  // Add to Cart Button
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child:  ElevatedButton(
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
      home: LipstickScreen(),
      debugShowCheckedModeBanner:false,
     ));
}
