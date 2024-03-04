import 'package:flutter/material.dart';
import 'package:poly_language/menubar/drawer_screen.dart';
import 'package:poly_language/screens/constant.dart';
import 'package:poly_language/screens/swipe_screen.dart';
import 'package:poly_language/signin/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimatedSplashScreen extends StatefulWidget {
  final bool isFirstTime;
  AnimatedSplashScreen({Key? key, required this.isFirstTime}) : super(key: key);

  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateToNextScreen();
      }
    });
  }

  void navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => isFirstTime ? IntroScreen() : CombinedScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor, // Change color to your preference
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0), // Make the image round
                child: Image.asset(
                  'assets/images/logo.png', // Replace with your image path
                  width: 150, // Customize width as needed
                  height: 150, // Customize height as needed
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Poly language',
                style: TextStyle(
                  color: Colors.white, // Change color to your preference
                  fontSize: 24, // Adjust size as needed
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
