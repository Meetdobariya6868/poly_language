import 'package:flutter/material.dart';
import 'package:poly_language/screens/pte_screen.dart';
import '../navigation/home_screen.dart';
import '../screens/constant.dart';
import '../screens/ielts_screen.dart';
import '../screens/toefel_screen.dart';

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
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            leading: isDrawerOpen
                ? GestureDetector(
              child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30),
              onTap: () {
                setState(() {
                  xOffset = 0;
                  yOffset = 0;
                  isDrawerOpen = false;
                });
              },
            )
                : GestureDetector(
              child: Icon(Icons.menu,color: Colors.white,size: 25),
              onTap: () {
                setState(() {
                  xOffset = 290;
                  yOffset = 80;
                  isDrawerOpen = true;
                });
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TrendingSection(),
                BrowseCategoriesSection(),
              ],
            ),
          ),
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
              fontSize: 18,
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
              _buildTrendingItem('IELTS', '3 courses', Icons.shopping_bag_outlined, () {
                // Navigate to the IELTS screen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IELTSScreen()),
                );
              }),
              _buildTrendingItem('PTE', '1 courses', Icons.lightbulb_outlined, () {
                // Navigate to the PTE screen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PTEScreen()),
                );
              }),
              _buildTrendingItem('TOEFL', '1 courses', Icons.cast_for_education_outlined, () {
                // Navigate to the TOEFL screen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TOFELScreen()),
                );
              }),
              // Add more items as needed
            ],
          ),
        ),

      ],
    );
  }

  Widget _buildTrendingItem(String title, String subtitle, IconData iconData, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Call the provided onTap function when tapped
      child: Container(
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
              child: Icon(iconData, size: 40), // Use the provided iconData
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
      ),
    );
  }
}


// class BrowseCategoriesSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//           child: Text(
//             'Browse Categories',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 10),
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.green.withOpacity(0.1),
//           ),
//           child: ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: 5, // Number of ListTiles
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 leading: Icon(Icons.category),
//                 title: Text('Category Title $index'),
//                 subtitle: Text('Course $index'),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

class BrowseCategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Browse Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to corresponding screen
              },
              child: _buildCategoryItem(
                icon: Icons.energy_savings_leaf_outlined,
                title: 'Design',
                subtitle: '1 Courses',
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to corresponding screen
              },
              child: _buildCategoryItem(
                icon: Icons.school_outlined,
                title: 'Academics',
                subtitle: '2 Course',
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to corresponding screen
              },
              child: _buildCategoryItem(
                icon: Icons.favorite_border_rounded,
                title: 'Health & Fitness',
                subtitle: '1 Course',
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to corresponding screen
              },
              child: _buildCategoryItem(
                icon: Icons.umbrella_sharp,
                title: 'Lifestyle',
                subtitle: '2 Course',
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to corresponding screen
              },
              child: _buildCategoryItem(
                icon: Icons.incomplete_circle_outlined,
                title: 'Marketing',
                subtitle: '0 Course',
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to corresponding screen
              },
              child: _buildCategoryItem(
                icon: Icons.developer_mode,
                title: 'Development',
                subtitle: '3 Course',
              ),
            ),
            // Add more category items as needed
          ],
        );
  }

  Widget _buildCategoryItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}