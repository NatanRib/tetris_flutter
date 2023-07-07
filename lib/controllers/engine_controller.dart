import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';
import 'package:tetris/pieces/piece_direction_enum.dart';
import 'package:tetris/pieces/piece_l.dart';
import 'package:tetris/pieces/piece_o.dart';
import 'package:tetris/utils/size_constants.dart';

class EngineController {
  late Piece currentPiece;
  Function updateState;
  List<List<Color?>> boardPixelsOccuped = List.generate(
    boardColumnLenght,
    (i) => List.generate(boardRowLenght, (j) => null),
  );

  EngineController(this.updateState);

  void startGame() {
    currentPiece = PieceO()..pixels.sort((a, b) => b.compareTo(a));
    const flameRate = Duration(milliseconds: 1500);
    gameLoop(flameRate);
  }

  void gameLoop(Duration flameRate) {
    Timer.periodic(flameRate, (timer) {
      checkLanding();
      moveDown();
      updateState();
      print(currentPiece.pixels);
    });
  }

  void moveDown() {
    currentPiece.movePiece(PieceDirectionEnum.down);
  }

  bool checkCollision(PieceDirectionEnum direction) {
    for (var i = 0; i < currentPiece.pixels.length; i++) {
      int currentPixel = currentPiece.pixels[i];
      print(
          "validando colisao da peca $currentPixel, tamanho dos pixels ${currentPiece.pixels.length}");
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
        int realrowPosition = getRowOfIndex(currentPiece.pixels[i]);
        int realcollumnPosition = getColumnOfIndex(currentPiece.pixels[i]);
        print("Colidiu em ${currentPiece.pixels}");
        return true;
      }

      continue;
    }
    return false;
  }

  void checkLanding() {
    if (checkCollision(PieceDirectionEnum.down)) {
      for (var i = 0; i < currentPiece.pixels.length; i++) {
        int column = getColumnOfIndex(currentPiece.pixels[i]);
        int row = getRowOfIndex(currentPiece.pixels[i]);
        if (row >= 0 && column >= 0 && row <= boardColumnLenght) {
          boardPixelsOccuped[row][column] = currentPiece.color;
        }
      }
      generatePiece();
    }
  }

  void generatePiece() {
    currentPiece = PieceO(); //TODO: random generate piece
  }
}
