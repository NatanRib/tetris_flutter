import 'package:flutter/material.dart';
import 'package:tetris/model/pieces/piece.dart';
import 'package:tetris/utils/board_utils.dart';

class GameStore {
  static final GameStore _gameStore = GameStore._internal();

  factory GameStore() {
    return _gameStore;
  }

  bool isGameOver = false;
  bool isPaused = false;
  bool stopButtonDown = false;
  int score = 0;
  int currentPieceRotateState = 1;
  late Piece currentPiece;
  late Piece nextPiece;
  List<List<Color?>> occupiedBoardPixels = List.generate(
    boardColumnLenght,
    (i) => List.generate(boardRowLenght, (j) => null),
  );

  void _resetOccupiedBoardPixels() {
    occupiedBoardPixels = List.generate(
      boardColumnLenght,
      (i) => List.generate(boardRowLenght, (j) => null),
    );
  }

  void resetData() {
    _resetOccupiedBoardPixels();
    score = 0;
  }

  GameStore._internal();
}
