import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece_direction_enum.dart';
import 'package:tetris/widgets/board.dart';
import 'package:tetris/widgets/input_controllers.dart';

import '/engine_controller.dart';

class Engine extends StatefulWidget {
  const Engine({super.key});

  @override
  State<Engine> createState() => _BoardState();
}

class _BoardState extends State<Engine> {
  late EngineController controller;

  @override
  void initState() {
    super.initState();
    controller = EngineController(() => setState(() {}));
    controller.startGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 13,
            child: Board(
              piece: controller.currentPiece,
              ocupedPixels: controller.occupiedBoardPixels,
            ),
          ),
          Expanded(
            flex: 3,
            child: InputController(
              leftButtonFunction: () =>
                  controller.movePiece(PieceDirectionEnum.left),
              rightButtonFunction: () =>
                  controller.movePiece(PieceDirectionEnum.right),
            ),
          )
        ],
      ),
    );
  }
}
