import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';

class PieceT extends Piece {
  @override
  Color color = Colors.orange;
  @override
  List<int> currentPixels = [3, 4, 5, 14];
  @override
  List<int> defaultPixels = [3, 4, 5, 14];
}
