import 'package:flutter/material.dart';

import '../screens/constant.dart';

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
        canvasColor: primaryColor, // Use primaryColor constant
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  5,
                      (index) => GestureDetector(
                    onTap: () => onItemTapped(index), // Navigate to the tapped index
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          index == selectedIndex
                              ? Icons.category
                              : index == 1
                              ? Icons.group
                              : index == 2
                              ? Icons.home
                              : index == 3
                              ? Icons.article
                              : Icons.camera,
                          color: index == selectedIndex
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        SizedBox(height: 2),
                        Text(
                          index == 0
                              ? 'Categories'
                              : index == 1
                              ? 'Providers'
                              : index == 2
                              ? 'Home'
                              : index == 3
                              ? 'Blog'
                              : 'My Camera',
                          style: TextStyle(
                            color: index == selectedIndex
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HalfDiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = primaryColor; // Use primaryColor constant
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
