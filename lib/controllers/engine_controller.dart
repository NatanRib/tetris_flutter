import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';
import 'package:tetris/pieces/piece_direction_enum.dart';
import 'package:tetris/pieces/piece_j.dart';
import 'package:tetris/pieces/piece_l.dart';
import 'package:tetris/pieces/piece_o.dart';
import 'package:tetris/pieces/piece_s.dart';
import 'package:tetris/pieces/piece_t.dart';
import 'package:tetris/pieces/piece_z.dart';
import 'package:tetris/utils/size_constants.dart';

class EngineController {
  late Piece currentPiece;
  Function updateState;
  List<List<Color?>> occupiedBoardPixels = List.generate(
    boardColumnLenght,
    (i) => List.generate(boardRowLenght, (j) => null),
  );
  List<Piece> availablePieces = [
    PieceL(),
    PieceO(),
    PieceZ(),
    PieceJ(),
    PieceS(),
    PieceT()
  ];

  EngineController(this.updateState);

  void startGame() {
    generatePiece();
    const flameRate = Duration(milliseconds: 400);
    gameLoop(flameRate);
  }

  void gameLoop(Duration flameRate) {
    Timer.periodic(flameRate, (timer) {
      checkLanding();
      moveDown();
      updateState();
    });
  }

  void moveDown() {
    currentPiece.movePiece(PieceDirectionEnum.down);
  }

  bool checkCollision(PieceDirectionEnum direction) {
    for (var i = 0; i < currentPiece.currentPixels.length; i++) {
      int currentPixel = currentPiece.currentPixels[i];
      print(
          "validando colisao da peca $currentPixel, tamanho dos pixels ${currentPiece.currentPixels.length}");
      int rowPosition = getRowOfIndex(currentPixel);
      int collumnPosition = getColumnOfIndex(currentPixel);

      switch (direction) {
        case PieceDirectionEnum.left:
          collumnPosition--;
          break;
        case PieceDirectionEnum.right:
          collumnPosition++;
          break;
        case PieceDirectionEnum.down:
          rowPosition++;
          break;
      }

      if (rowPosition >= boardColumnLenght ||
          collumnPosition < 0 ||
          collumnPosition >= boardRowLenght) {
        return true;
      }

      continue;
    }
    return false;
  }

  void checkLanding() {
    if (checkCollision(PieceDirectionEnum.down)) {
      for (var i = 0; i < currentPiece.currentPixels.length; i++) {
        int column = getColumnOfIndex(currentPiece.currentPixels[i]);
        int row = getRowOfIndex(currentPiece.currentPixels[i]);
        if (row >= 0 && column >= 0 && row <= boardColumnLenght) {
          occupiedBoardPixels[row][column] = currentPiece.color;
        }
      }
      generatePiece();
    }
  }

  void generatePiece() {
    int randomPieceIndex = Random().nextInt(5);
    Piece newPiece = availablePieces[randomPieceIndex]
      ..initializeOnTopOfBoard();
    currentPiece = newPiece;
  }
}
