import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Initialize notification settings (these can be loaded from a model or API)
  bool productUpdates = true;
  bool promotionsOffers = false;
  bool orderStatus = true;
  bool appNewsUpdates = true;
  bool wishlistReminders = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black, // Black text for contrast
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink[50], // Light pink AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Save notifications settings functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings Saved')),
              );
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
              const Text(
                'Notification Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Black text color for contrast
                ),
              ),
              const SizedBox(height: 20),

              // Product Updates Notification
              _buildNotificationTile(
                title: 'Product Updates',
                value: productUpdates,
                onChanged: (bool value) {
                  setState(() {
                    productUpdates = value;
                  });
                },
              ),
              const Divider(color: Colors.black54),

              // Promotions & Offers Notification
              _buildNotificationTile(
                title: 'Promotions & Offers',
                value: promotionsOffers,
                onChanged: (bool value) {
                  setState(() {
                    promotionsOffers = value;
                  });
                },
              ),
              const Divider(color: Colors.black54),

              // Order Status Notification
              _buildNotificationTile(
                title: 'Order Status',
                value: orderStatus,
                onChanged: (bool value) {
                  setState(() {
                    orderStatus = value;
                  });
                },
              ),
              const Divider(color: Colors.black54),

              // App News & Updates Notification
              _buildNotificationTile(
                title: 'App News & Updates',
                value: appNewsUpdates,
                onChanged: (bool value) {
                  setState(() {
                    appNewsUpdates = value;
                  });
                },
              ),
              const Divider(color: Colors.black54),

              // Wishlist Reminders Notification
              _buildNotificationTile(
                title: 'Wishlist Reminders',
                value: wishlistReminders,
                onChanged: (bool value) {
                  setState(() {
                    wishlistReminders = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom method to build a notification tile with a toggle
  Widget _buildNotificationTile({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white.withOpacity(0.8),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black, // Black text color for better readability
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.pink, // Pink toggle color when active
        ),
      ),
    );
  }
}
