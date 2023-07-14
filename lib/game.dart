import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tetris/pieces/piece_direction_enum.dart';
import 'package:tetris/utils/board_utils.dart';
import 'package:tetris/widgets/board.dart';
import 'package:tetris/widgets/input_controllers.dart';

import 'game_controller.dart';

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

  // @override
  // void didUpdateWidget(covariant Game oldWidget) {
  //   //TODO não esta chamando aqui apos o gameOver
  //   if (controller.gameOver) {
  //     gameOver(context);
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    if (controller.gameOver) gameOver(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: Board(
                piece: controller.currentPiece,
                ocupedPixels: controller.occupiedBoardPixels,
                height: constraints.maxHeight * 0.808 / boardColumnLenght,
                width: constraints.maxWidth / boardRowLenght,
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.16,
              child: InputController(
                leftButtonFunction: () =>
                    controller.movePiece(PieceDirectionEnum.left),
                rightButtonFunction: () =>
                    controller.movePiece(PieceDirectionEnum.right),
                rotateButtonFunction: () => controller.rotatePiece(),
                score: controller.score,
              ),
            ),
          ],
        );
      }),
    );
  }

  void gameOver(BuildContext context) {
    print("gameOver");
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
