import 'package:flutter/material.dart';

import 'cart_screen.dart';

class EyeShadowScreen extends StatelessWidget {
  const EyeShadowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eyeShadows = [
      {'image': 'assets/eyeshadow_palette.png', 'name': 'Palette Shadow', 'price': 'PKR 2,000'},
      {'image': 'assets/eyeshadow_matte.png', 'name': 'Matte Shadow', 'price': 'PKR 1,800'},
      {'image': 'assets/eyeshadow_shimmer.png', 'name': 'Shimmer Shadow', 'price': 'PKR 2,200'},
      {'image': 'assets/eyeshadow_glitter.png', 'name': 'Glitter Shadow', 'price': 'PKR 2,500'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Eye Shadows',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
          itemCount: eyeShadows.length,
          itemBuilder: (ctx, index) {
            final product = eyeShadows[index];
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
                      height: 150, // Increased the size of the image
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
                      child: // Replace the ElevatedButton's onPressed function
                      ElevatedButton(
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
      home: EyeShadowScreen(),
      debugShowCheckedModeBanner:false,
     ));
}
