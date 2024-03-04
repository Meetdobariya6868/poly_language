import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poly_language/navigation/home_screen.dart';

import '../menubar/drawer_screen.dart';

// CustomTextField class definition here

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Welcome back! ✌️',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                Text(
                  'Login to your account and enjoy learning...',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                SizedBox(height: screenHeight * 0.15), // Adjusted using MediaQuery// Email TextField
                CustomTextField(
                  prefixIcon: Icons.mail,
                  hintText: 'Email', controller: emailController,
                ),
                SizedBox(height: 20.0),

                // Password TextField
                CustomTextField(
                  prefixIcon: Icons.lock,
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(height: screenHeight * 0.15), // Adjusted using MediaQuery// Email TextField
                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Get the input from text fields
                      String email = emailController.text;
                      String password = passwordController.text;

                      // Check if email and password match
                      if (email == "123" && password == "123") {
                        // Redirect to home page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => CombinedScreen()),
                        );
                      } else {
                        // Show toast for wrong password
                        Fluttertoast.showToast(
                          msg: "Incorrect password. Please try again.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Adjust the radius here
                        ),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Adjusted using MediaQuery// Email TextField
                // Terms & Policies Text
                Center(
                  child: Text(
                    'By using our services, you agree to our Terms & Policies',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CustomTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller; // Add controller property

  const CustomTextField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    this.obscureText = false,
    required this.controller, // Accept controller in the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller, // Bind controller to TextField
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: Colors.grey),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
