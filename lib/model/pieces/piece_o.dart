import 'package:flutter/material.dart';
import 'package:tetris/model/pieces/piece.dart';

class PieceO extends Piece {
  @override
  Color color = const Color.fromARGB(255, 28, 208, 253);
  @override
  List<int> currentPixels = [4, 5, 14, 15];
  @override
  List<int> defaultPixels = [4, 5, 14, 15];
  @override
  List<int> decreasedPixels = [0, 1, 4, 3];
  @override
  int rotationStatesLenght = 1;

  @override
  void rotate(int rotationState) {
    // this piece dont rotate
  }
}
