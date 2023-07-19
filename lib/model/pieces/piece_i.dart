import 'package:flutter/material.dart';
import 'package:tetris/model/pieces/piece.dart';
import 'package:tetris/utils/board_utils.dart';

class PieceI extends Piece {
  @override
  Color color = const Color.fromARGB(255, 250, 61, 124);

  @override
  List<int> currentPixels = [5, 15, 25, 35];

  @override
  List<int> defaultPixels = [5, 15, 25, 35];
  @override
  int rotationStatesLenght = 2;

  @override
  void rotate(int rotationState) {
    switch (rotationState) {
      case 2:
        currentPixels[0] = currentPixels[0] + (boardRowLenght * 2) + 2;
        currentPixels[1] = currentPixels[1] + boardRowLenght + 1;
        currentPixels[3] = currentPixels[3] - boardRowLenght - 1;
        break;
      case 1:
        currentPixels[0] = currentPixels[0] - (boardRowLenght * 2) - 2;
        currentPixels[1] = currentPixels[1] - boardRowLenght - 1;
        currentPixels[3] = currentPixels[3] + boardRowLenght + 1;
        break;
    }
  }
}
