import 'package:flutter/material.dart';
import 'package:poly_language/menubar/drawer_screen.dart';
import 'package:poly_language/screens/splash_screen.dart';
import 'package:poly_language/screens/swipe_screen.dart';
import 'package:poly_language/signin/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('first_time') ?? true;

  runApp(MyApp(isFirstTime: isFirstTime),
  );
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  const MyApp({super.key, required this.isFirstTime});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poly_language',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(isFirstTime: isFirstTime),
    );
  }
}
