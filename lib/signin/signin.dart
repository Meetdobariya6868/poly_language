import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../menubar/drawer_screen.dart';
import '../navigation/navigation_screen.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Welcome back! ✌️',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    // Icon(Icons.hand),
                  ],
                ),
              ),
              Text(
                'Login to your account and enjoy learning...',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              SizedBox(height: 30.0),
              Spacer(), // Space between subtext and text fields

              // Email TextField
              CustomTextField(
                prefixIcon: Icons.mail,
                hintText: 'Email',
              ),
              SizedBox(height: 20.0),

              // Password TextField
              CustomTextField(
                prefixIcon: Icons.lock,
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 20.0),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 50.0, // Specify the height of the button
                child: ElevatedButton(
                  onPressed: () {
                    // Add your login logic here
                    String email = "123";
                    String password = "123";

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
              SizedBox(height: 20.0),
              Spacer(),

              // Terms & Policies Text
              Text(
                'By using our services, you agree to our Terms & Policies',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0),
              ),
            ],
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

  const CustomTextField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
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
