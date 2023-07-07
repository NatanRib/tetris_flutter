import 'dart:ui';
import 'package:tetris/pieces/piece_direction_enum.dart';
import 'package:tetris/utils/size_constants.dart';

abstract class Piece {
  abstract List<int> pixels;
  abstract Color color;

  void movePiece(PieceDirectionEnum direction) {
    switch (direction) {
      case PieceDirectionEnum.down:
        for (int i = 0; i < pixels.length; i++) {
          pixels[i] += boardRowLenght;
        }
        break;
      case PieceDirectionEnum.left:
        break;
      case PieceDirectionEnum.right:
        break;
    }
  }
}
