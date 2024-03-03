import 'package:flutter/material.dart';

class CorsesScreen extends StatefulWidget {
  @override
  State<CorsesScreen> createState() => _CorsesScreenState();
}

class _CorsesScreenState extends State<CorsesScreen> {
  double xOffset = 0;

  double yOffset = 0;

  bool isDrawerOpen = false;
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
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Courses',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                decoration: TextDecoration.none,
              ),
            ),
            leading: isDrawerOpen
                ? GestureDetector(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        isDrawerOpen = false;
                      });
                    },
                  )
                : GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () {
                      setState(() {
                        xOffset = 290;
                        yOffset = 80;
                        isDrawerOpen = true;
                      });
                    },
                  ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Purchased'),
                  Tab(text: 'Organization'),
                  // Tab(text: 'Consultant'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // InstructorsTab(),
                    // OrganizationsTab(),
                    _buildContent('assets/images/intro2.jpg', 'No Courses!',
                        'Start learning now by enrolling on courses.')
                    // ConsultantsTab(),
                  ],
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}