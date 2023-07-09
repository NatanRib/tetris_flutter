import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';

class PieceL extends Piece {
  @override
  Color color = Colors.green;
  @override
  List<int> currentPixels = [4, 14, 24, 25];
  @override
  List<int> defaultPixels = [4, 14, 24, 25];
  @override
  int rotationStatesLenght = 4;

  @override
  void rotate(int rotationState) {
    // TODO: implement rotate
  }
}
