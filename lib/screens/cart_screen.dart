import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ProductScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

// Dummy Product Screen for Testing
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'name': 'Gold Shimmer Highlighter', 'price': 'PKR 2,100'},
      {'name': 'Rose Shimmer Highlighter', 'price': 'PKR 2,200'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.pink[50],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product['name']!),
            subtitle: Text(product['price']!),
            trailing: ElevatedButton(
              onPressed: () {
                Cart.addToCart(product['name']!, product['price']!);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product['name']} added to cart!')),
                );
              },
              child: const Text('Add to Cart'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

// Cart Data Management
class Cart {
  static final List<Map<String, dynamic>> _cartItems = [];

  static List<Map<String, dynamic>> get cartItems => _cartItems;

  static void addToCart(String name, String price) {
    final existingItem = _cartItems.firstWhere(
          (item) => item['name'] == name,
      orElse: () => {},
    );
    if (existingItem.isNotEmpty) {
      existingItem['quantity']++;
    } else {
      _cartItems.add({'name': name, 'price': price, 'quantity': 1});
    }
  }

  static void updateQuantity(String name, int change) {
    final item = _cartItems.firstWhere((item) => item['name'] == name);
    item['quantity'] += change;
    if (item['quantity'] <= 0) {
      _cartItems.remove(item);
    }
  }

  static void clearCart() {
    _cartItems.clear();
  }
}

// Cart Screen
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = Cart.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.pink[50],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.jpg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: cartItems.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shopping_cart, size: 100, color: Colors.black),
              const SizedBox(height: 16),
              const Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Continue Shopping'),
              ),
            ],
          ),
        )
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(item['name']),
                        subtitle: Text('Price: ${item['price']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  Cart.updateQuantity(item['name'], -1);
                                });
                              },
                            ),
                            Text('${item['quantity']}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  Cart.updateQuantity(item['name'], 1);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Cart.clearCart();
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order Confirmed!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[100],
                ),
                child: const Text('Confirm Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
