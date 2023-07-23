import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  final Color color;
  final String? text;
  const Pixel({
    super.key,
    required this.color,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: text != null
            ? Text(text!, style: const TextStyle(color: Colors.white))
            : const SizedBox.shrink(),
      ),
    );
  }
}
