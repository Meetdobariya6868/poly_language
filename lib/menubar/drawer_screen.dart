import 'package:flutter/material.dart';
import 'package:poly_language/screens/assignment_screen.dart';
import 'package:poly_language/screens/constant.dart';
import 'package:poly_language/screens/metting_screen.dart';
import 'package:poly_language/screens/quizz_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navigation/blog_screen.dart';
import '../navigation/courses_drawer_screen.dart';
import '../navigation/courses_screen.dart';
import '../navigation/categories_screen.dart';
import '../navigation/custom_bottom_navigation.dart';
import '../navigation/home_screen.dart';
import '../navigation/provider_screen.dart';
import '../screens/certificate_screen.dart';
import '../screens/comment_screen.dart';
import '../screens/dash_board_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/new_room.dart';
import '../screens/profile_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/subscription_screen.dart';
import '../screens/support_message_screen.dart';

class CombinedScreen extends StatefulWidget {
  @override
  _CombinedScreenState createState() => _CombinedScreenState();
}

class _CombinedScreenState extends State<CombinedScreen> {
  double xOffset = 0;
  double yOffset = 0;
  int _selectedIndex = 2;

  bool isDrawerOpen = false;

  final List<Widget> _screens = [
    CategoriesScreen(),
    ProvidersScreen(),
    HomeScreen(), // Include HomeScreen here
    BlogScreen(),
    CorsesScreen(),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored data in SharedPreferences
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildDrawer(),
          _screens[_selectedIndex], // The currently selected screen
          // buildHomeScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home_outlined, color: _selectedIndex == 2 ? primaryColor : Colors.white,),
        onPressed: () {
          setState(() {
            _screens[_selectedIndex];
            _selectedIndex = 2;
          });
        },
        backgroundColor: _selectedIndex == 2 ? Colors.white : primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BottomAppBar(
          color: primaryColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        _screens[_selectedIndex];
                        _selectedIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.category_outlined,
                          size: 25,
                          color: _selectedIndex == 0 ? Colors.white : Colors.blue,
                        ),
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 12,
                            color: _selectedIndex == 0 ? Colors.white : Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        _screens[_selectedIndex];
                        _selectedIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people_alt_outlined,
                          size: 25,
                          color: _selectedIndex == 1 ? Colors.white : Colors.blue,
                        ),
                        Text(
                          'Providers',
                          style: TextStyle(
                            fontSize: 12,
                            color: _selectedIndex == 1 ? Colors.white : Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // Right tabbar icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        _screens[_selectedIndex];
                        _selectedIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.newspaper_outlined,
                          size: 25,
                          color: _selectedIndex == 3 ? Colors.white : Colors.blue,
                        ),
                        Text(
                          'Blog',
                          style: TextStyle(
                            fontSize: 12,
                            color: _selectedIndex == 3 ? Colors.white : Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        _screens[_selectedIndex];
                        _selectedIndex = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.video_camera_back_outlined,
                          size: 25,
                          color: _selectedIndex == 4 ? Colors.white : Colors.blue,
                        ),
                        Text(
                          'My Courses',
                          style: TextStyle(
                            fontSize: 12,
                            color: _selectedIndex == 4 ? Colors.white : Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget buildDrawer() {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Poly Language',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
            SizedBox(height: 50),
            Expanded(
              child: SingleChildScrollView( // Wrap the column with SingleChildScrollView
                child: Column(
                  children: <Widget>[
                    NewRow(
                      text: 'Settings',
                      icon: Icons.settings,
                      onTap: () {
                        // Handle navigation to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NewRow(
                      text: 'Dashboard',
                      icon: Icons.dashboard_customize_rounded,
                      onTap: () {
                        // Handle navigation to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DashboardScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NewRow(
                      text: 'Courses',
                      icon: Icons.video_call_outlined,
                      onTap: () {
                        // Handle navigation to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CoursesDrawerScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NewRow(
                      text: 'Meetings',
                      icon: Icons.calendar_month_outlined,
                      onTap: () {
                        // Handle navigation to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MettingScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NewRow(
                      text: 'Assignments',
                      icon: Icons.task_rounded,
                      onTap: () {
                        // Handle navigation to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AssignmentScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NewRow(
                      text: 'Quizzes',
                      icon: Icons.quiz_rounded,
                      onTap: () {
                        // Handle navigation to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizzScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NewRow(
                      text: 'Certificates',
                      icon: Icons.stars_rounded,
                      onTap: () {
                        // Handle navigation to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CertificateScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NewRow(
                      text: 'Favorites',
                      icon: Icons.favorite_border_rounded,
                      onTap: () {
                        // Handle navigation to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FavoriteScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NewRow(
                      text: 'Comments',
                      icon: Icons.comment,
                      onTap: () {
                        // Handle navigation to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CommentScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NewRow(
                      text: 'Financial',
                      icon: Icons.account_balance_wallet,
                      onTap: () {
                        // Handle navigation to Settings screen
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SettingsScreen()),
                        // );
                      },
                    ),
                    SizedBox(height: 20),
                    NewRow(
                      text: 'Subscription',
                      icon: Icons.newspaper,
                      onTap: () {
                        // Handle navigation to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SubscriptionPage()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NewRow(
                      text: 'Support',
                      icon: Icons.mail_lock_rounded,
                      onTap: () {
                        // Handle navigation to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SupportMessageScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm Logout'),
                      content: Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            logout(); // Call the logout function
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AnimatedSplashScreen(isFirstTime: false)), (route) => false); // Navigate to the splash screen and remove all previous routes
                          },
                          child: Text('Logout'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.cancel,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
