import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';

class PieceL extends Piece {
  @override
  List<int> pixels = [-5, -16, -6, -26];
  // [4, 14, 24, 25];

  @override
  Color color = Colors.green;
}
