import 'package:flutter/material.dart';
import '../navigation/home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  // State variables for managing drawer animation
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false; // State variable to track if drawer is open

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
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isDrawerOpen
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
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        decoration: TextDecoration.none),
                  ),
                  Container(),
                ],
              ),
            ),
            // SizedBox(
            //   height: 40,
            // ),
            TrendingSection(),
            BrowseCategoriesSection(),
          ],
        ),
      ),
    );
  }

}


class TrendingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            'Trending',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 120,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildTrendingItem('Title 1', 'Subtitle 1'),
              _buildTrendingItem('Title 2', 'Subtitle 2'),
              _buildTrendingItem('Title 3', 'Subtitle 3'),
              // Add more items as needed
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingItem(String title, String subtitle) {
    return Container(
      width: 180, // Adjust width as needed
      margin: EdgeInsets.only(right: 10), // Add spacing between items
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.green.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: double.infinity,
            alignment: Alignment.center,
            child: Icon(Icons.shopping_bag_sharp, size: 40),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class BrowseCategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            'Browse Categories',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green.withOpacity(0.1),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5, // Number of ListTiles
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.category),
                title: Text('Category Title $index'),
                subtitle: Text('Course $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}
