import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  PersonalInfoScreenState createState() => PersonalInfoScreenState();
}

class PersonalInfoScreenState extends State<PersonalInfoScreen> {
  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  bool isEdited = false; // To track if information has been modified

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    nameController.dispose();
    emailController.dispose();
    contactController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Info',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20), // Add some spacing at the top
              Expanded(
                child: ListView(
                  children: [
                    _buildTextField(
                      controller: nameController,
                      label: 'Name',
                      icon: Icons.person,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: emailController,
                      label: 'Email',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: contactController,
                      label: 'Contact',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: ageController,
                      label: 'Age',
                      icon: Icons.calendar_today,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              // Save or Edit button at the bottom
              ElevatedButton(
                onPressed: isEdited ? savePersonalInfo : editPersonalInfo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB76E79), // Deeper pink to differentiate
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners for consistency
                  ),
                  elevation: 5, // Subtle shadow for a 3D effect
                ),
                child: Text(
                  isEdited ? 'Save' : 'Edit',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white, // White text for contrast with deeper pink
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields with common design
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required TextInputType keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.pink, width: 2),
        ),
        prefixIcon: Icon(icon, color: Colors.black),
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }

  // Function to validate email format
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  // Function to validate phone number length (11 digits)
  bool isValidPhone(String phone) {
    return phone.length == 11;
  }

  // Function to save personal information
  void savePersonalInfo() {
    final String name = nameController.text;
    final String email = emailController.text;
    final String contact = contactController.text;
    final String age = ageController.text;

    // Basic validation
    if (name.isEmpty || email.isEmpty || contact.isEmpty || age.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (!isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email format')),
      );
      return;
    }

    if (!isValidPhone(contact)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone number must be 11 digits')),
      );
      return;
    }

    // Debugging output
    if (kDebugMode) {
      print('Name: $name');
      print('Email: $email');
      print('Contact: $contact');
      print('Age: $age');
    }

    // Show a snack bar for user feedback
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Personal info saved')),
    );

    // Optionally, you could also clear the text fields after saving
    nameController.clear();
    emailController.clear();
    contactController.clear();
    ageController.clear();

    // Switch button to Edit mode
    setState(() {
      isEdited = false;
    });
  }

  // Function to allow editing the personal information
  void editPersonalInfo() {
    setState(() {
      isEdited = true; // Enable editing mode
    });
  }
}
