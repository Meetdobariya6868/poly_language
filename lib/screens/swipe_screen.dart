import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poly_language/screens/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../signin/signin.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Map<String, String>> introData = [
    {
      "image": "assets/images/intro1.jpg",
      "title": "Start learning now!",
      "subtitle": "Interested in to learn from the best teachers around th world?"
    },
    {
      "image": "assets/images/intro2.jpg",
      "title": "Learn IELTS",
      "subtitle": "A journey of a thousand miles begins with a single step."
    },
    {
      "image": "assets/images/intro3.jpg",
      "title": "Start now",
      "subtitle": "It always seems impossible until it’s done."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: introData.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return IntroPage(
                  image: introData[index]['image']!,
                  title: introData[index]['title']!,
                  subtitle: introData[index]['subtitle']!,
                  isLastPage: index == introData.length - 1,
                  onPressed: () async {
                    if (index == introData.length - 1) {
                      // Navigate to sign in screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );

                      // Update SharedPreferences to indicate that intro screens have been shown
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('first_time', false);
                    }
                    else {
                      // Swipe to the next page
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              introData.length,
                  (index) => buildDot(index: index),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: _currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}


class IntroPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final bool isLastPage;
  final VoidCallback onPressed;

  const IntroPage({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.isLastPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          SizedBox(height: 20.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 40.0),
          if (isLastPage)
            Container(
              width: MediaQuery.of(context).size.width / 2, // Set button width to half of screen width
              child: ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(primaryColor), // Set button background color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Set button border radius
                    ),
                  ),
                  elevation: MaterialStateProperty.all<double>(3.0), // Set button elevation
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 16.0)), // Set button padding
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(
                      fontSize: 18.0, // Set button text size
                    ),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white, // Set button text color
                    fontWeight: FontWeight.bold, // Set button text bold
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}