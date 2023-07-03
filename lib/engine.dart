import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';
import 'package:tetris/pieces/piece_l.dart';
import 'package:tetris/widgets/board.dart';

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
    controller.gameLoop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Board(piece: controller.currentPiece));
  }
}

class EngineController {
  Piece currentPiece = PieceL();
  Function updateState;

  EngineController(this.updateState);

  void gameLoop() {
    var frameRate = const Duration(milliseconds: 500);
    Timer.periodic(frameRate, (timer) {
      moveDown();
      updateState();
    });
  }

  void moveDown() {
    currentPiece.moveDown();
  }
}
