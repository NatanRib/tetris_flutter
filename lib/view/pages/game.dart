import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tetris/model/pieces/piece_direction_enum.dart';
import 'package:tetris/utils/board_utils.dart';
import 'package:tetris/utils/my_colors.dart';
import 'package:tetris/view/widgets/board.dart';
import 'package:tetris/view/widgets/input_controllers.dart';

import '../../controller/game_controller.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _BoardState();
}

class _BoardState extends State<Game> {
  late GameController controller;

  @override
  void initState() {
    super.initState();
    controller = GameController(() => setState(() {}));
    controller.startGame();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.gameOver) gameOver(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.blueGrey,
        title: Text(
          "Score: ${controller.score}",
          style: const TextStyle(
            color: MyColors.yellow,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: MyColors.blueGrey,
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Board(
                  piece: controller.currentPiece,
                  backgroundColor: MyColors.blueGrey,
                  ocupedPixels: controller.occupiedBoardPixels,
                  height: constraints.maxHeight * 0.782 / boardColumnLenght,
                  width: constraints.maxWidth / boardRowLenght,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.14,
                child: InputController(
                  leftButtonFunction: () =>
                      controller.movePiece(PieceDirectionEnum.left),
                  rightButtonFunction: () =>
                      controller.movePiece(PieceDirectionEnum.right),
                  downButtonFunction: () =>
                      controller.movePiece(PieceDirectionEnum.down),
                  rotateButtonFunction: () => controller.rotatePiece(),
                  score: controller.score,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void gameOver(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Game Over :(',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  'Your score: ${controller.score}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextButton(
                    child: const Text(
                      "Restart",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      controller.restartGame();
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}
