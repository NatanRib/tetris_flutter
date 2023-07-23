import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris/model/pieces/piece.dart';
import 'package:tetris/model/pieces/piece_direction_enum.dart';
import 'package:tetris/model/pieces/piece_i.dart';
import 'package:tetris/model/pieces/piece_j.dart';
import 'package:tetris/model/pieces/piece_l.dart';
import 'package:tetris/model/pieces/piece_o.dart';
import 'package:tetris/model/pieces/piece_s.dart';
import 'package:tetris/model/pieces/piece_t.dart';
import 'package:tetris/model/pieces/piece_z.dart';
import 'package:tetris/controller/store/game_store.dart';
import 'package:tetris/utils/board_utils.dart';

class GameController {
  Function updateState;
  GameStore store;
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
  final velocity = const Duration(milliseconds: 800);

  GameController({
    required this.updateState,
    required this.store,
  });

  void init() {
    if (store.isPaused) {
      resumeGame();
    } else {
      startGame();
    }
  }

  void startGame() {
    store.resetData();
    generateNewPiece();
    gameLoop();
  }

  void resumeGame() {
    store.isPaused = false;
    gameLoop();
  }

  void gameLoop() {
    Timer.periodic(velocity, (timer) {
      checkLanding();
      _movePieceDown();
      cleanCompletedRow();
      updateState();
      if (store.isGameOver || store.isPaused) timer.cancel();
    });
  }

  void movePiece(PieceDirectionEnum direction) {
    if (!checkCollision(direction)) {
      store.currentPiece.movePiece(direction);
      updateState();
    }
  }

  void _movePieceDown() {
    if (!checkCollision(PieceDirectionEnum.down)) {
      store.currentPiece.movePiece(PieceDirectionEnum.down);
    }
  }

  bool checkCollision(PieceDirectionEnum direction) {
    for (var i = 0; i < store.currentPiece.currentPixels.length; i++) {
      int currentPixel = store.currentPiece.currentPixels[i];
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
          ? store.occupiedBoardPixels.elementAtOrNull(rowPosition)
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
      store.stopButtonDown = true;
      for (var i = 0; i < store.currentPiece.currentPixels.length; i++) {
        int column = getColumnOfIndex(store.currentPiece.currentPixels[i]);
        int row = getRowOfIndex(store.currentPiece.currentPixels[i]);
        if (row < 0 && !store.isGameOver) {
          _gameOver();
          return;
        }
        if (row >= 0 && column >= 0 && row <= boardColumnLenght) {
          store.occupiedBoardPixels[row][column] = store.currentPiece.color;
        }
      }
      generateNewPiece();
    }
  }

  void generateNewPiece() {
    store.currentPieceRotateState = 1;
    int randomPieceIndex = Random().nextInt(availablePieces.length);
    Piece newPiece = availablePieces[randomPieceIndex]
      ..initializeOnTopOfBoard();
    store.currentPiece = newPiece;
  }

  void cleanCompletedRow() {
    List<int> completedRows = _getCompletedRows();
    for (var row in completedRows) {
      for (var i = row; i >= 0; i--) {
        if (i == 0) {
          store.occupiedBoardPixels[i] =
              List.generate(boardRowLenght, (boardRowLenght) => null);
          continue;
        }
        List<Color?> nextRpw = List.from(store.occupiedBoardPixels[i - 1]);
        store.occupiedBoardPixels[i] = nextRpw;
      }
    }
  }

  List<int> _getCompletedRows() {
    List<int> completedRows = [];
    for (var i = 0; i < boardColumnLenght; i++) {
      if (store.occupiedBoardPixels[i].every((element) => element != null)) {
        completedRows.add(i);
      }
    }
    if (completedRows.isNotEmpty) increaseScore(completedRows.length);
    return completedRows;
  }

  void increaseScore(int multiply) {
    store.score += 10 * multiply;
  }

  void rotatePiece() {
    var side = _getDirectionOnBoard(store.currentPiece.currentPixels[1]);
    if (checkCollision(side)) return;
    store.currentPieceRotateState++;
    if (store.currentPieceRotateState <=
        store.currentPiece.rotationStatesLenght) {
      store.currentPiece.rotate(store.currentPieceRotateState);
    } else {
      store.currentPieceRotateState = 1;
      store.currentPiece.rotate(1);
    }
    updateState();
  }

  PieceDirectionEnum _getDirectionOnBoard(int index) {
    return getColumnOfIndex(index) <= boardRowLenght / 2
        ? PieceDirectionEnum.left
        : PieceDirectionEnum.right;
  }

  void _gameOver() {
    store.isGameOver = true;
  }

  void restartGame() {
    store.isGameOver = false;
    store.score = 0;
    startGame();
  }

  void pauseGame() {
    store.isPaused = true;
  }
}
