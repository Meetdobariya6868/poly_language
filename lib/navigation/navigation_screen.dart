import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bottom Navigation Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;

  final List<Widget> _screens = [
    CategoriesScreen(),
    ProvidersScreen(),
    HomeScreen(),
    BlogScreen(),
    CameraScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Demo'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.green,
        primaryColor: Colors.white,
      ),
      child: ClipRect(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: CustomPaint(
                  painter: HalfDiamondPainter(),
                ),
              ),
            ),
            BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: onItemTapped,
              items: [
                bottomNavigationBarItem(Icons.category, 'Categories'),
                bottomNavigationBarItem(Icons.group, 'Providers'),
                bottomNavigationBarItem(Icons.home, 'Home'),
                bottomNavigationBarItem(Icons.article, 'Blog'),
                bottomNavigationBarItem(Icons.camera, 'My Camera'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.white),
      label: label,
    );
  }
}

class HalfDiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.green;
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Categories Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProvidersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Providers Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class BlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Blog Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Camera Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
