import 'package:flutter/material.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryScreenState createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      // Add email validation logic here if needed
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Password reset link sent to your email!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        _errorMessage = 'Please enter a valid email address.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Makes the body extend behind the AppBar
      appBar: AppBar(
        title: const Text('Password Recovery'),
        backgroundColor: Colors.transparent, // Set AppBar background to transparent
        elevation: 0, // Remove shadow from the AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black), // Change arrow color to black
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background2.jpg',  // Your background image
              fit: BoxFit.cover, // Ensure the image covers the entire screen
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Removed the "Recover your password" text
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.email, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      errorText: _errorMessage,
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value == null || value.isEmpty || !RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _resetPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDAA49A), // Button color set to pink
                    padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 18), // Increased horizontal padding for longer button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 4, // Adding a subtle shadow for depth
                  ),
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold), // Larger text for better readability
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
