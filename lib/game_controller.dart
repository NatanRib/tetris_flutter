import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';
import 'package:tetris/pieces/piece_direction_enum.dart';
import 'package:tetris/pieces/piece_i.dart';
import 'package:tetris/pieces/piece_j.dart';
import 'package:tetris/pieces/piece_l.dart';
import 'package:tetris/pieces/piece_o.dart';
import 'package:tetris/pieces/piece_s.dart';
import 'package:tetris/pieces/piece_t.dart';
import 'package:tetris/pieces/piece_z.dart';
import 'package:tetris/utils/board_utils.dart';

class GameController {
  late Piece currentPiece;
  Function updateState;
  late List<List<Color?>> occupiedBoardPixels;
  List<Piece> availablePieces = [
    PieceL(),
    PieceO(),
    PieceZ(),
    PieceJ(),
    PieceS(),
    PieceT(),
    PieceO(),
    PieceI()
  ];
  int score = 0;
  int currentPieceRotateState = 1;
  bool gameOver = false;

  GameController(this.updateState);

  void startGame() {
    occupiedBoardPixels = List.generate(
      boardColumnLenght,
      (i) => List.generate(boardRowLenght, (j) => null),
    );
    generatePiece();
    const velocity = Duration(milliseconds: 800);
    // gameLoop(velocity);
  }

  void gameLoop(Duration flameRate) {
    Timer.periodic(flameRate, (timer) {
      checkLanding();
      _movePieceDown();
      cleanCompletedRow();
      updateState();
      if (gameOver) timer.cancel();
    });
  }

  void movePiece(PieceDirectionEnum direction) {
    if (!checkCollision(direction)) {
      currentPiece.movePiece(direction);
      updateState();
    }
  }

  void _movePieceDown() {
    if (!checkCollision(PieceDirectionEnum.down)) {
      currentPiece.movePiece(PieceDirectionEnum.down);
    }
  }

  bool checkCollision(PieceDirectionEnum direction) {
    for (var i = 0; i < currentPiece.currentPixels.length; i++) {
      int currentPixel = currentPiece.currentPixels[i];
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
      List<Color?>? occupiedRow = rowPosition >= 0
          ? occupiedBoardPixels.elementAtOrNull(rowPosition)
          : null;

      if (rowPosition >= boardColumnLenght ||
          collumnPosition < 0 ||
          collumnPosition >= boardRowLenght) {
        return true;
      } else if (occupiedRow != null &&
          occupiedRow.elementAt(collumnPosition) != null) {
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
        if (row < 0 && !gameOver) {
          isGameOver();
          return;
        }
        if (row >= 0 && column >= 0 && row <= boardColumnLenght) {
          occupiedBoardPixels[row][column] = currentPiece.color;
        }
      }
      generatePiece();
    }
  }

  void generatePiece() {
    currentPieceRotateState = 1;
    int randomPieceIndex = Random().nextInt(availablePieces.length);
    Piece newPiece = availablePieces[randomPieceIndex]
      ..initializeOnTopOfBoard();
    currentPiece = newPiece;
  }

  void cleanCompletedRow() {
    List<int> completedRows = _getCompletedRows();
    for (var row in completedRows) {
      for (var i = row; i >= 0; i--) {
        if (i == 0) {
          occupiedBoardPixels[i] =
              List.generate(boardRowLenght, (boardRowLenght) => null);
          continue;
        }
        List<Color?> nextRpw = List.from(occupiedBoardPixels[i - 1]);
        occupiedBoardPixels[i] = nextRpw;
      }
    }
  }

  List<int> _getCompletedRows() {
    List<int> completedRows = [];
    for (var i = 0; i < boardColumnLenght; i++) {
      if (occupiedBoardPixels[i].every((element) => element != null)) {
        completedRows.add(i);
      }
    }
    if (completedRows.isNotEmpty) increaseScore(completedRows.length);
    return completedRows;
  }

  void increaseScore(int multiply) {
    score += 100 * multiply;
  }

  void rotatePiece() {
    var side = _getDirectionOnBoard(currentPiece.currentPixels[1]);
    if (checkCollision(side)) return;
    currentPieceRotateState++;
    if (currentPieceRotateState <= currentPiece.rotationStatesLenght) {
      currentPiece.rotate(currentPieceRotateState);
    } else {
      currentPieceRotateState = 1;
      currentPiece.rotate(1);
    }
    updateState();
  }

  void isGameOver() {
    gameOver = true;
  }

  void restartGame() {
    gameOver = false;
    score = 0;
    startGame();
  }

  PieceDirectionEnum _getDirectionOnBoard(int index) {
    return getColumnOfIndex(index) <= boardRowLenght / 2
        ? PieceDirectionEnum.left
        : PieceDirectionEnum.right;
  }
}
