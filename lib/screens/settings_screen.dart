import 'package:flutter/material.dart';

// Import screens
import 'personal_info.dart'; // Import the Personal Info screen
import 'notification_screen.dart'; // Import the Notifications screen
import 'privacy_setting.dart'; // Import the Privacy Settings screen
import 'help_support.dart'; // Import the Help & Support screen
import 'about_app.dart'; // Import the About App screen

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink[50], // Light pink background for the AppBar
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1, // Slight shadow for AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.jpg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'App Settings',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Personal Info
            _buildSettingOption(
              context,
              icon: Icons.person,
              title: 'Personal Info',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PersonalInfoScreen()),
              ),
            ),
            const SizedBox(height: 8),

            // Notifications
            _buildSettingOption(
              context,
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              ),
            ),
            const SizedBox(height: 8),

            // Privacy Settings
            _buildSettingOption(
              context,
              icon: Icons.lock,
              title: 'Privacy Settings',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacySettingsScreen()),
              ),
            ),
            const SizedBox(height: 8),

            // Help & Support
            _buildSettingOption(
              context,
              icon: Icons.help,
              title: 'Help & Support',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpSupportScreen()),
              ),
            ),
            const SizedBox(height: 8),

            // About App
            _buildSettingOption(
              context,
              icon: Icons.info,
              title: 'About App',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutAppScreen()),
              ),
            ),
            const SizedBox(height: 8),

            // Logout option
            _buildSettingOption(
              context,
              icon: Icons.logout,
              title: 'Logout',
              onTap: () => _showLogoutDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption(BuildContext context,
      {required IconData icon, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9), // Semi-transparent white
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Logout',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Perform necessary logout actions or navigate to login screen
              },
            ),
          ],
        );
      },
    );
  }
}
