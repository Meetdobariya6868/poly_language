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
//       home: FavoriteScreen(),
//     );
//   }
// }

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the leading icon to white
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text('Favorites',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FavoriteItem(
              title: 'Item 1',
              subtitle: 'This is the first favorite item',
              icon: Icons.favorite,
              onPressed: () {
                // Handle onPressed
              },
            ),
            SizedBox(height: 10),
            FavoriteItem(
              title: 'Item 2',
              subtitle: 'This is the second favorite item',
              icon: Icons.favorite,
              onPressed: () {
                // Handle onPressed
              },
            ),
            // Add more FavoriteItem widgets for additional items
          ],
        ),
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;

  const FavoriteItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        onTap: onPressed,
        leading: Icon(
          icon,
          color: Colors.red,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Handle delete onPressed
          },
        ),
      ),
    );
  }
}
