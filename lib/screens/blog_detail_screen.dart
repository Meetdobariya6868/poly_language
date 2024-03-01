import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {
  final String title;
  final String date;
  final String companyLogoUrl;
  final String companyName;
  final String category;
  final String description;
  final String image;

  const BlogDetailScreen({
    required this.title,
    required this.date,
    required this.companyLogoUrl,
    required this.companyName,
    required this.category,
    required this.description,
    required String companyLogo,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Post'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 5),
                      Text(date),
                    ],
                  ),
                  SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(companyLogoUrl),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            companyName,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Author: $category',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Blog Topics:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Rule #1: Something text of description text.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rule #2: Something text of description text.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: BlogDetailScreen(
//       title: 'Blog Title',
//       date: 'March 15, 2024',
//       imageUrl: 'https://via.placeholder.com/500',
//       companyLogoUrl: 'https://via.placeholder.com/100',
//       companyName: 'Company Name',
//       category: 'Author Name',
//       description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
//           'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
//           'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
//           'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
//           'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
//           'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia '
//           'deserunt mollit anim id est laborum.',
//     ),
//   ));
// }
