import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About CosmoChic'),
        backgroundColor: Colors.pink[50], // Soft pink background to match the app's theme
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Save about app functionality
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.jpg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              // Title of the app section
              const Text(
                'About CosmoChic',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Roboto', // Customizable font
                ),
              ),
              const SizedBox(height: 16),

              // App description text
              const Text(
                'CosmoChic is your ultimate guide to explore and shop for the best makeup products. '
                    'Discover a wide variety of makeup items such as foundations, lipsticks, eyeshadows, and more, '
                    'from top brands and in different categories like eye makeup, face makeup, and lip makeup.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  height: 1.6, // Increased line height for better readability
                  fontFamily: 'Arial', // Customizable font
                ),
              ),
              const SizedBox(height: 20),

              // Features section header
              const Text(
                'Features:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 8),

              // Features List
              const Text(
                '- Browse and explore makeup products by category.\n'
                    '- Add your favorite items to your Wishlist.\n'
                    '- Get notifications on new arrivals and exclusive offers.\n'
                    '- Personalized recommendations based on your preferences.\n'
                    '- Save your personal information for a smoother shopping experience.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  height: 1.6, // Increased line height for better readability
                  fontFamily: 'Arial',
                ),
              ),
              const SizedBox(height: 20),

              // Conclusion text about the app
              const Text(
                'Enjoy a seamless shopping experience with CosmoChic, '
                    'your go-to makeup app for staying stylish and trendy.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  height: 1.6,
                  fontFamily: 'Arial',
                ),
              ),
              const SizedBox(height: 20),

              // Footer or credits
              const Text(
                'CosmoChic - Stay Beautiful, Stay Chic!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
