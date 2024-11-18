import 'package:flutter/material.dart';

import 'cart_screen.dart';

class FoundationScreen extends StatefulWidget {
  const FoundationScreen({super.key});

  @override
  FoundationScreenState createState() => FoundationScreenState();
}

class FoundationScreenState extends State<FoundationScreen> {
  final List<Map<String, String>> foundations = [
    {'image': 'assets/foundation_light.png', 'name': 'Light Foundation', 'price': 'PKR 2,000'},
    {'image': 'assets/foundation_medium.png', 'name': 'Medium Foundation', 'price': 'PKR 2,500'},
    {'image': 'assets/foundation_dark.png', 'name': 'Dark Foundation', 'price': 'PKR 2,800'},
  ];

  get product => null;

  void _addToCart(String productName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$productName added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foundations'),
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
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9, // Adjust the aspect ratio for a better design
          ),
          itemCount: foundations.length,
          itemBuilder: (ctx, index) {
            return _buildProductCard(
              foundations[index]['image']!,
              foundations[index]['name']!,
              foundations[index]['price']!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(String image, String name, String price) {
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
              image,
              height: 155, // Adjusted image size for better presentation
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            price,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const Spacer(),
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
  }
}

void main() {
  runApp(const MaterialApp(
      home: FoundationScreen(),
      debugShowCheckedModeBanner:false,
     ));
}
