import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // List of makeup products
  final List<String> makeupProducts = [
    'Foundation',
    'Lipstick',
    'Eyeliner',
    'Blush',
    'Mascara',
    'Eyeshadow',
    'Highlighter',
    'Lip Gloss',
    'Concealer',
    'Setting Spray'
  ];

  // This will store the filtered products
  List<String> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = makeupProducts; // Initialize with all products
  }

  void _filterProducts(String query) {
    setState(() {
      filteredProducts = makeupProducts
          .where((product) =>
          product.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.jpg'),  // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  _filterProducts(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Search for makeup products',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filteredProducts[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: SearchScreen()));
