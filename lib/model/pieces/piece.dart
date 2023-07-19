import 'dart:ui';
import 'package:tetris/model/pieces/piece_direction_enum.dart';
import 'package:tetris/utils/board_utils.dart';

abstract class Piece {
  abstract List<int> defaultPixels;
  abstract List<int> currentPixels;
  abstract int rotationStatesLenght;
  abstract Color color;

  void movePiece(PieceDirectionEnum direction) {
    switch (direction) {
      case PieceDirectionEnum.down:
        for (int i = 0; i < currentPixels.length; i++) {
          currentPixels[i] += boardRowLenght;
        }
        break;
      case PieceDirectionEnum.left:
        for (int i = 0; i < currentPixels.length; i++) {
          currentPixels[i]--;
        }
        break;
      case PieceDirectionEnum.right:
        for (int i = 0; i < currentPixels.length; i++) {
          currentPixels[i]++;
        }
        break;
    }
  }

  void initializeOnTopOfBoard() {
    resetPosition();
    for (int i = 0; i < currentPixels.length; i++) {
      currentPixels[i] -= (boardRowLenght * 4);
    }
  }

  void resetPosition() {
    currentPixels = defaultPixels.map((e) => e).toList();
  }

  void rotate(int rotationState);
}
