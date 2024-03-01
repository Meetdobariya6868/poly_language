import 'package:flutter/material.dart';

import 'home_screen.dart';

class ProvidersScreen extends StatefulWidget {
  @override
  State<ProvidersScreen> createState() => _ProvidersScreenState();
}

class _ProvidersScreenState extends State<ProvidersScreen> {
  // State variables for managing drawer animation
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

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
            title: Text(
              'Providers',
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
              Container(
                color: Colors.green.withOpacity(0.1),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'What are you going to find?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              TabBar(
                tabs: [
                  Tab(text: 'Instructors'),
                  Tab(text: 'Organizations'),
                  Tab(text: 'Consultant'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    InstructorsTab(),
                    OrganizationsTab(),
                    ConsultantsTab(),
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


class InstructorsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1,
      ),
      itemCount: 10, // Assuming you have 10 instructors
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile.jpg'), // You can replace this with actual image
              ),
              SizedBox(height: 10),
              Text(
                'Username',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Role',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star_half, color: Colors.amber,size: 15),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class OrganizationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1,
      ),
      itemCount: 10, // Assuming you have 10 instructors
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile.jpg'), // You can replace this with actual image
              ),
              SizedBox(height: 10),
              Text(
                'Username',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Role',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star_half, color: Colors.amber,size: 15),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class ConsultantsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1,
      ),
      itemCount: 10, // Assuming you have 10 instructors
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile.jpg'), // You can replace this with actual image
              ),
              SizedBox(height: 10),
              Text(
                'Username',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Role',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star, color: Colors.amber,size: 15),
                  Icon(Icons.star_half, color: Colors.amber,size: 15),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}


