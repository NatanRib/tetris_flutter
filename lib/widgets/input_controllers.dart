import 'package:flutter/material.dart';

class InputController extends StatelessWidget {
  final Function leftButtonFunction;
  final Function rightButtonFunction;

  const InputController({
    super.key,
    required this.leftButtonFunction,
    required this.rightButtonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          button(
            leftButtonFunction,
            false,
          ),
          button(
            rightButtonFunction,
            true,
          )
        ],
      ),
    );
  }

  Widget button(Function onPressed, bool isInvert) {
    return IconButton.outlined(
      onPressed: () => onPressed(),
      icon: Icon(
        Icons.arrow_back,
        size: 50,
        textDirection: isInvert ? TextDirection.rtl : TextDirection.ltr,
      ),
      color: Colors.white,
    );
  }
}
