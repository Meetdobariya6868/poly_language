import 'package:flutter/material.dart';
import 'package:poly_language/screens/constant.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CommentScreen(),
//     );
//   }
// }

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the leading icon to white
        ),
        title: Text('Comments',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommentItem(
              username: 'User 1',
              comment: 'This is an amazing comment!',
              profileImageUrl: 'assets/images/ielts1.jpg',
            ),
            SizedBox(height: 20),
            CommentItem(
              username: 'User 2',
              comment: 'Great job!',
              profileImageUrl: 'assets/images/ielts2.jpg',
            ),
            // Add more CommentItem widgets for additional comments
          ],
        ),
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final String username;
  final String comment;
  final String profileImageUrl;

  const CommentItem({
    Key? key,
    required this.username,
    required this.comment,
    required this.profileImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(profileImageUrl),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  comment,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
