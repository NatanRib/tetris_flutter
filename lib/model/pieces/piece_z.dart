import 'package:flutter/material.dart';
import 'package:tetris/model/pieces/piece.dart';
import 'package:tetris/utils/board_utils.dart';

class PieceZ extends Piece {
  @override
  Color color = const Color.fromARGB(255, 32, 255, 132);
  @override
  List<int> currentPixels = [4, 5, 13, 14];
  @override
  List<int> defaultPixels = [4, 5, 13, 14];
  @override
  @override
  int rotationStatesLenght = 2;

  @override
  void rotate(int rotationState) {
    switch (rotationState) {
      case 2:
        currentPixels[1] = currentPixels[1] + boardRowLenght - 1;
        currentPixels[2] = currentPixels[2] - (boardRowLenght * 2);
        currentPixels[3] = currentPixels[3] - boardRowLenght - 1;
        break;
      case 1:
        currentPixels[0] = currentPixels[0] - boardRowLenght;
        currentPixels[1] = currentPixels[1] - (boardRowLenght * 2) + 1;
        currentPixels[2] = currentPixels[2] + boardRowLenght;
        currentPixels[3] = currentPixels[3] + 1;
        break;
    }
  }
}
