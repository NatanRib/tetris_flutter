import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tetris/widgets/board.dart';

import 'controllers/engine_controller.dart';

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
      body: Board(
        piece: controller.currentPiece,
        ocupedPixels: controller.occupiedBoardPixels,
      ),
    );
  }
}
