import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:poly_language/screens/constant.dart';

import '../screens/blog_detail_screen.dart';

class BlogScreen extends StatefulWidget {
  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
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
            backgroundColor: primaryColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Blog',
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
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3, // Adjust as per the number of blogs
              itemBuilder: (context, index) {
                return BlogCard(
                  image: 'assets/images/blog${index + 1}.jpg',
                  companyLogo: 'assets/images/intro${index + 1}.jpg',
                  companyName: 'Company $index',
                  title: 'Blog Title $index',
                  subtitle: 'This is a subtitle for blog $index. It can be a bit longer to test the layout.',
                  date: 'March 15, 2024', // Replace with actual date
                  comments: 5, // Replace with actual number of comments
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final String image;
  final String companyLogo;
  final String companyName;
  final String title;
  final String subtitle;
  final String date;
  final int comments;

  const BlogCard({
    required this.image,
    required this.companyLogo,
    required this.companyName,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogDetailScreen(
                    title: title,
                    image: image,
                    companyName: companyName,
                    companyLogo: companyLogo,
                    description: subtitle,
                    date: date,
                    // companyLogoUrl: 'aseets/images/intro1.jpg',
                    category: '',
                    // Add any other necessary data
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    image,
                    height: 175,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: FractionalTranslation(
                    translation: Offset(0.0, 0.5),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(
                          height: 30, // Adjust the height of the blurred area
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 7,
                  left: 7,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(companyLogo),
                      ),
                      SizedBox(width: 10),
                      Text(
                        companyName,
                        style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 10),

          // SizedBox(height: 10),
          // Row(
          //   children: [
          //     CircleAvatar(
          //       radius: 20,
          //       backgroundImage: AssetImage(companyLogo),
          //     ),
          //     SizedBox(width: 10),
          //     Text(
          //       companyName,
          //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.calendar_today),
              SizedBox(width: 5),
              Text(date),
              SizedBox(width: 20),
              Icon(Icons.comment),
              SizedBox(width: 5),
              Text('$comments Comments'),
            ],
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: BlogScreen(),
//   ));
// }
