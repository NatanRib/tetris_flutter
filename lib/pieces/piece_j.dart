import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';

class PieceJ extends Piece {
  @override
  Color color = Colors.amber;
  @override
  List<int> currentPixels = [5, 15, 25, 24];
  @override
  List<int> defaultPixels = [5, 15, 25, 24];
}
