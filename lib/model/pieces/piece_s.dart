import 'package:flutter/material.dart';
import 'package:tetris/model/pieces/piece.dart';
import 'package:tetris/utils/board_utils.dart';

class PieceS extends Piece {
  @override
  Color color = const Color.fromARGB(255, 23, 255, 31);
  @override
  List<int> currentPixels = [3, 4, 14, 15];
  @override
  List<int> defaultPixels = [3, 4, 14, 15];
  @override
  int rotationStatesLenght = 2;

  @override
  void rotate(int rotationState) {
    switch (rotationState) {
      case 2:
        currentPixels[0] = currentPixels[0] - boardRowLenght + 1;
        currentPixels[2] = currentPixels[2] - boardRowLenght - 1;
        currentPixels[3] = currentPixels[3] - 2;
        break;
      case 1:
        currentPixels[0] = currentPixels[0] - 1;
        currentPixels[1] = currentPixels[1] - boardRowLenght;
        currentPixels[2] = currentPixels[2] + 1;
        currentPixels[3] = currentPixels[3] - boardRowLenght + 2;
        break;
    }
  }
}
