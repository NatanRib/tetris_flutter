import 'package:flutter/material.dart';
import 'package:tetris/controller/store/game_store.dart';
import 'package:tetris/view/widgets/down_button.dart';

import 'next_piece_indicator.dart';

class InputController extends StatelessWidget {
  final Function leftButtonFunction;
  final Function rightButtonFunction;
  final Function downButtonFunction;
  final Function rotateButtonFunction;
  final int score;
  final double height;

  const InputController({
    super.key,
    required this.leftButtonFunction,
    required this.rightButtonFunction,
    required this.downButtonFunction,
    required this.rotateButtonFunction,
    required this.score,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    GameStore gameStore = GameStore();
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          button(
            Icons.arrow_back,
            leftButtonFunction,
            false,
            const EdgeInsets.only(left: 8),
          ),
          button(
            Icons.rotate_right,
            rotateButtonFunction,
            false,
            EdgeInsets.zero,
          ),
          NextPieceIndicator(
            nextPiece: gameStore.nextPiece,
            height: height * 1.15,
            width: width * 0.13,
          ),
          DownButton(downButtonFunction: downButtonFunction),
          button(
            Icons.arrow_back,
            rightButtonFunction,
            true,
            const EdgeInsets.only(right: 8),
          ),
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
