import 'package:flutter/material.dart';

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap; // Callback function

  const NewRow({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap, // Accepting callback function
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Assigning onTap callback
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
