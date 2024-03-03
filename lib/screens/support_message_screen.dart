import 'package:flutter/material.dart';

import '../screens/constant.dart';

class SupportMessageScreen extends StatelessWidget {
  const SupportMessageScreen({Key? key}) : super(key: key);

  Widget _buildContent(String imagePath, String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 200, // Adjust image width as needed
          height: 200, // Adjust image height as needed
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor, // Set primary color as blue
        scaffoldBackgroundColor: Colors.white, // Set scaffold background color as grey
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white, // Set text field background color as white
        ),
      ),
      home: DefaultTabController(
        length: 2, // Define the number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text('Support Messages'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(); // Pop the current route to go back to the previous route
              },
            ),
            bottom: TabBar( // Add TabBar to the appBar
              tabs: [
                Tab(text: 'Tickets'),
                Tab(text: 'Courses Support'),
              ],
            ),
          ),
          body: TabBarView( // Add TabBarView to switch between tabs
            children: [
              // Define content for Tab 1
              _buildContent('assets/images/intro2.jpg', 'No Tickets!',
                  'Need help? Create new support request.')
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add functionality for the floating action button
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
