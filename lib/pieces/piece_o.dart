import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';

class PieceO extends Piece {
  @override
  List<int> pixels = [4, 5, 14, 15];

  @override
  Color color = Colors.purple;
}
