import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Automatically navigate to Welcome Screen after 8 seconds
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),  // Add background image in assets
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '𝓒𝓸𝓼𝓶𝓸𝓬𝓱𝓲𝓬',
                style: TextStyle(
                  fontSize: 70,  // Reduced font size for 'Cosmochic'
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,  // Changed to black color
                  fontFamily: 'Times New Roman',  // Times New Roman font style
                  letterSpacing: 2, // Slightly increased letter spacing for elegance
                ),
              ),
              const SizedBox(height: 10),  // Reduced spacing between the texts
              Text(
                '𝓛𝓮𝓽𝓼 𝓬𝓱𝓸𝓸𝓼𝓮 𝓪 𝓵𝓸𝓸𝓴',

                style: TextStyle(
                  fontSize: 30,  // Reduced font size for 'Lets choose a look'
                  color: Colors.black.withOpacity(0.8),  // Slightly translucent black for a soft look
                  fontFamily: 'Times New Roman',  // Times New Roman font style
                  fontWeight: FontWeight.normal,  // Normal font weight for a lighter feel
                  fontStyle: FontStyle.italic,  // Italic style for the text
                    // Increased letter spacing for readability
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
