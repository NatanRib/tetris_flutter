import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';

class PieceZ extends Piece {
  @override
  List<int> currentPixels = [4, 5, 13, 14];
  @override
  List<int> defaultPixels = [4, 5, 13, 14];
  @override
  Color color = Colors.lightBlue;

  @override
  int rotationStatesLenght = 4;

  @override
  void rotate(int rotationState) {
    // TODO: implement rotate
  }
}
