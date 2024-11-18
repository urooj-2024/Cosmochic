import 'package:flutter/material.dart';
import 'powder.dart'; // Import Powder Screen
import 'foundation.dart'; // Import Foundation Screen
import 'primer.dart'; // Import Primer Screen
import 'concealer.dart'; // Import Concealer Screen

class FaceMakeup extends StatelessWidget {
  const FaceMakeup({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'image': 'assets/setting_powder.png',
        'name': 'Powder',
        'screen': const PowderScreen(), // Navigate to PowderScreen
      },
      {
        'image': 'assets/foundation.png',
        'name': 'Foundation',
        'screen': const FoundationScreen(), // Navigate to FoundationScreen
      },
      {
        'image': 'assets/primer.png',
        'name': 'Primer',
        'screen': const PrimerScreen(), // Navigate to PrimerScreen
      },
      {
        'image': 'assets/concealer.png',
        'name': 'Concealer',
        'screen': const ConcealerScreen(), // Navigate to ConcealerScreen
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Face Makeup',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.pink[50],
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.jpg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: categories.length,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the specific screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => categories[index]['screen']),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.9), // Transparent-like background
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Rounded Image with Shadow
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          categories[index]['image']!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Category Name
                    Text(
                      categories[index]['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(), // Push the arrow icon to the end
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20),
                    ),
                  ],
                ),
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
    home: FaceMakeup(),
    debugShowCheckedModeBanner: false, // Disable the debug banner
  ));
}
