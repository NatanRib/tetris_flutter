import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  final Color color;
  final String? text;
  final double width;
  final double height;
  const Pixel({
    super.key,
    required this.color,
    this.text,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: text != null
            ? Text(text!, style: const TextStyle(color: Colors.white))
            : const SizedBox.shrink(),
      ),
    );
  }
}
