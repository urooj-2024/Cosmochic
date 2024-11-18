import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.pink[50], // Soft pink background for aesthetic look
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Save support settings functionality
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
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Header for FAQ section
              const Text(
                'Frequently Asked Questions (FAQ)',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              // Question 1
              const Text(
                'Q1: How do I add products to my Wishlist?',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 8),
              const Text(
                'A: Navigate to the product you like and click on the heart icon to add it to your Wishlist.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              // Question 2
              const Text(
                'Q2: How do I receive notifications for new products?',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 8),
              const Text(
                'A: Go to Settings > Notifications and enable product alerts to stay updated on new arrivals.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              // Question 3
              const Text(
                'Q3: How do I update my personal information?',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 8),
              const Text(
                'A: Go to Settings > Personal Info to update your name, email, contact, and other details.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              // Need Further Assistance Section
              const SizedBox(height: 24),
              const Text(
                'Need Further Assistance?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'For more support, feel free to contact us at:',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),

              // Contact Support Button (Clickable)
              ElevatedButton.icon(
                onPressed: () {
                  _showContactDetails(context);
                },
                icon: const Icon(Icons.contact_support, color: Colors.white), // Add email icon
                label: const Text(
                  'Contact Support',
                  style: TextStyle(
                    fontSize: 18, // Increased font size for readability
                    color: Colors.white, // White text for high contrast
                    fontWeight: FontWeight.w600, // Increased weight for readability
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDAA49A), // Soft pink button color
                  padding: const EdgeInsets.symmetric(vertical: 18), // Increased height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4, // Subtle shadow for depth
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show contact details (CosmoChic email or phone number)
  void _showContactDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.pink[50], // Light pink background for the dialog
          title: const Text(
            'Contact Support',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'You can reach us at the following:',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Icon(Icons.email, color: Colors.black, size: 24), // Email icon
                  SizedBox(width: 10),
                  Text(
                    'Email: support@cosmochic.com',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.phone, color: Colors.black, size: 24), // Phone icon
                  SizedBox(width: 10),
                  Text(
                    'Phone: +92 300 1234567', // Valid Pakistani phone number
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red, // Red background for the button
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Close',
                style: TextStyle(fontSize: 16), // Larger font size for readability
              ),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HelpSupportScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
