import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';

class PieceS extends Piece {
  @override
  Color color = Colors.teal;
  @override
  List<int> currentPixels = [3, 4, 14, 15];
  @override
  List<int> defaultPixels = [3, 4, 14, 15];
  @override
  int rotationStatesLenght = 4;

  @override
  void rotate(int rotationState) {
    // TODO: implement rotate
  }
}
