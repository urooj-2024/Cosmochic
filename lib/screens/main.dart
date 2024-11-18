import 'package:flutter/material.dart';
import 'eye_makeup.dart';
import 'face_makeup.dart';
import 'lip_makeup.dart';
import 'blush_highlighter.dart';
import 'virtual_try.dart'; // Virtual Try-On Screen
import 'cart_screen.dart';
import 'settings_screen.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedIndex = 0;
  String _searchQuery = '';
  List<String> _products = [
    'Eye Makeup',
    'Face Makeup',
    'Lip Makeup',
    'Blush Highlighter',
    'Foundation',
    'Lipstick',
    'Mascara',
  ]; // Example products list
  List<String> _filteredProducts = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateWithTransition(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredProducts = _products; // Initialize with all products
  }

  void _filterSearchResults(String query) {
    setState(() {
      _searchQuery = query;
      _filteredProducts = _products
          .where((product) =>
          product.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Hello, Urooj',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar with Hover Effect
                MouseRegion(
                  onEnter: (_) {
                    setState(() {});
                  },
                  onExit: (_) {
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.pink[100], // Light grey color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.black),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            onChanged: _filterSearchResults,
                            decoration: InputDecoration(
                              hintText: 'Search Products',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Product Search Suggestions
                _searchQuery.isNotEmpty
                    ? _filteredProducts.isNotEmpty
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Search Results',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _filteredProducts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_filteredProducts[index]),
                          leading: Image.asset(
                            'assets/${_filteredProducts[index].toLowerCase().replaceAll(' ', '_')}.jpg', // Dynamically getting product images
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            // Navigate to the product details screen
                            if (_filteredProducts[index] == 'Eye Makeup') {
                              _navigateWithTransition(context, const EyeMakeup());
                            } else if (_filteredProducts[index] == 'Face Makeup') {
                              _navigateWithTransition(context, const FaceMakeup());
                            } else if (_filteredProducts[index] == 'Lip Makeup') {
                              _navigateWithTransition(context, const LipMakeup());
                            } else if (_filteredProducts[index] == 'Blush Highlighter') {
                              _navigateWithTransition(context, const BlushHighlighterMakeup());
                            }
                          },
                        );
                      },
                    ),
                  ],
                )
                    : const Center(child: Text('No results found'))
                    : const SizedBox(),

                const SizedBox(height: 20),

                // Category Slider Section
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCategoryImage('assets/eye_makeup.jpg'),
                      _buildCategoryImage('assets/face_makeup.jpg'),
                      _buildCategoryImage('assets/lip_makeup.jpg'),
                      _buildCategoryImage('assets/blush_highlighter.jpg'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Product Categories Section
                const Text(
                  'Product Categories',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildProductCategoryContainer(
                        'Eye Makeup',
                        'assets/eye_makeup.jpg',
                            () {
                          _navigateWithTransition(context, const EyeMakeup());
                        },
                      ),
                      _buildProductCategoryContainer(
                        'Face Makeup',
                        'assets/face_makeup.jpg',
                            () {
                          _navigateWithTransition(context, const FaceMakeup());
                        },
                      ),
                      _buildProductCategoryContainer(
                        'Lip Makeup',
                        'assets/lip_makeup.jpg',
                            () {
                          _navigateWithTransition(context, const LipMakeup());
                        },
                      ),
                      _buildProductCategoryContainer(
                        'Blush Highlighter',
                        'assets/blush_highlighter.jpg',
                            () {
                          _navigateWithTransition(context, const BlushHighlighterMakeup());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.pink[50]?.withOpacity(0.9),
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face, color: Colors.black),
              label: 'Virtual Try-On',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            if (index == 2) {
              _navigateWithTransition(context, const CartScreen());
            } else if (index == 1) {
              _navigateWithTransition(context, const VirtualTryOnScreen());
            } else if (index == 3) {
              _navigateWithTransition(context, const SettingsScreen());
            } else {
              _onItemTapped(index);
            }
          },
        ),
      ),
    );
  }

  Widget _buildCategoryImage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductCategoryContainer(String title, String imagePath, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}
