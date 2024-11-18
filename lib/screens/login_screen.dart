import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'password_recovery_screen.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isEmailValid = true;
  bool _isPasswordStrong = true;

  // Email validation regex
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  void _login() {
    setState(() {
      _isEmailValid = _emailRegex.hasMatch(_emailController.text);
      _isPasswordStrong = _passwordController.text.length >= 8;
    });

    if (_isEmailValid && _isPasswordStrong && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CategoriesScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Avoid screen being pushed up on keyboard open
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.jpg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: SingleChildScrollView( // Allows scrolling in case keyboard comes up
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Email input
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                      icon: const Icon(Icons.email, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7), // Soft, semi-transparent background
                      errorText: _isEmailValid ? null : 'Invalid email format',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pinkAccent, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _isEmailValid ? Colors.grey : Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),

                  // Password input
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                      icon: const Icon(Icons.lock, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7), // Soft, semi-transparent background
                      errorText: _isPasswordStrong ? null : 'Password must be at least 8 characters',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _isPasswordStrong ? Colors.grey : Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Login button with increased height and reduced length
                  SizedBox(
                    width: 300, // Fixed width to reduce length and make it compact
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDAA49A), // Soft pink button color
                        padding: const EdgeInsets.symmetric(vertical: 18), // Increased height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4, // Subtle shadow for depth
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18, // Increased font size for readability
                          color: Colors.white, // White text for high contrast
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Forgot password link
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PasswordRecoveryScreen()),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black, // Black color for visibility on the light background
                        fontSize: 16, // Slightly larger font size for readability
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
