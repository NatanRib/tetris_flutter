import 'package:flutter/material.dart';
import 'package:tetris/view/widgets/down_button.dart';

class InputController extends StatelessWidget {
  final Function leftButtonFunction;
  final Function rightButtonFunction;
  final Function downButtonFunction;
  final Function rotateButtonFunction;
  final int score;

  const InputController({
    super.key,
    required this.leftButtonFunction,
    required this.rightButtonFunction,
    required this.downButtonFunction,
    required this.rotateButtonFunction,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: button(
                  Icons.arrow_back,
                  leftButtonFunction,
                  false,
                  const EdgeInsets.only(left: 8),
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

          //TODO: Next piece
          Row(
            children: [
              DownButton(downButtonFunction: downButtonFunction),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: button(
                  Icons.arrow_back,
                  rightButtonFunction,
                  true,
                  const EdgeInsets.only(right: 8),
                ),
              )
            ],
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
    return TextButton(
      onPressed: () => onPressed(),
      child: Icon(
        icon,
        textDirection: isInvert ? TextDirection.rtl : TextDirection.ltr,
        size: 50,
      ),
    );
  }
}
