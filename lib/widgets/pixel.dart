import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  final Color color;
  final String text;
  const Pixel({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
