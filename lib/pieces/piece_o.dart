import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';

class PieceO extends Piece {
  @override
  Color color = Colors.purple;
  @override
  List<int> currentPixels = [4, 5, 14, 15];
  @override
  List<int> defaultPixels = [4, 5, 14, 15];
}
