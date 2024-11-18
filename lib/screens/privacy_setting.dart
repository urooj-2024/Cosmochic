import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  _PrivacySettingsScreenState createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool shareData = true;
  bool receiveProductUpdates = true;
  bool receivePromotionalOffers = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController forgottenPasswordEmailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isForgotPassword = false; // Flag to toggle forgotten password form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Settings',
          style: TextStyle(
            color: Colors.black, // Set text color to black for visibility
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink[50], // Light pink background for a fresh look
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Save privacy settings functionality
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
                'Privacy Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Color for better readability
                ),
              ),
              const SizedBox(height: 20),

              // Data Sharing Toggle
              _buildPrivacyTile(
                title: 'Share data with third parties',
                value: shareData,
                onChanged: (bool value) {
                  setState(() {
                    shareData = value;
                  });
                },
              ),
              const Divider(color: Colors.black54),

              // Notification Preferences Section
              const Text(
                'Notification Preferences',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              _buildPrivacyTile(
                title: 'Receive product updates',
                value: receiveProductUpdates,
                onChanged: (bool value) {
                  setState(() {
                    receiveProductUpdates = value;
                  });
                },
              ),
              _buildPrivacyTile(
                title: 'Receive promotional offers',
                value: receivePromotionalOffers,
                onChanged: (bool value) {
                  setState(() {
                    receivePromotionalOffers = value;
                  });
                },
              ),
              const Divider(color: Colors.black54),

              // Account Settings Section
              const Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              // Account Deletion Section
              _buildClickableTile(
                title: 'Delete Account',
                onTap: () {
                  _showDeleteAccountDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom widget to build Privacy settings with a toggle (switch)
  Widget _buildPrivacyTile({
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
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.pink, // Pink color when active
        ),
      ),
    );
  }

  // Custom clickable tile for Account settings (like Delete Account)
  Widget _buildClickableTile({
    required String title,
    required Function() onTap,
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
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  // Function to show dialog for account deletion
  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isForgotPassword) ...[
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isForgotPassword = true;
                      });
                    },
                    child: const Text(
                      'Forgotten Password?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ] else ...[
                  TextFormField(
                    controller: forgottenPasswordEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email (for password reset)',
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  if (isForgotPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password reset email sent')),
                    );
                  } else {
                    // Handle account deletion with valid email and password
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Account Deleted')),
                    );
                  }
                  Navigator.of(context).pop(); // Close the dialog after deletion
                }
              },
              child: Text(isForgotPassword ? 'Send Reset Link' : 'Delete Account'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.pink[100], // Black text
              ),
            ),
          ],
        );
      },
    );
  }
}
