import 'package:flutter/material.dart';

class InputController extends StatelessWidget {
  final Function leftButtonFunction;
  final Function rightButtonFunction;
  final Function rotateButtonFunction;
  final int score;

  const InputController(
      {super.key,
      required this.leftButtonFunction,
      required this.rightButtonFunction,
      required this.rotateButtonFunction,
      required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          button(
            Icons.arrow_back_ios,
            leftButtonFunction,
            false,
            const EdgeInsets.only(left: 8),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Score: $score",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              button(
                Icons.rotate_right,
                rotateButtonFunction,
                false,
                EdgeInsets.zero,
              ),
            ],
          ),
          button(
            Icons.arrow_back_ios,
            rightButtonFunction,
            true,
            const EdgeInsets.only(right: 8),
          )
        ],
      ),
    );
  }

  Widget button(
    IconData icon,
    Function onPressed,
    bool isInvert,
    EdgeInsets edges,
  ) {
    return IconButton(
      padding: edges,
      hoverColor: Colors.red,
      onPressed: () => onPressed(),
      icon: Icon(
        icon,
        size: 50,
        textDirection: isInvert ? TextDirection.rtl : TextDirection.ltr,
        color: Colors.white,
      ),
      color: Colors.white,
    );
  }
}
