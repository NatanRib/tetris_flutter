import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';
import 'package:tetris/utils/size_constants.dart';
import 'package:tetris/widgets/pixel.dart';

class Board extends StatelessWidget {
  final int columnsLength;
  final int rowsLenght;
  final Piece piece;
  const Board({
    super.key,
    this.columnsLength = boardColumnsSize,
    this.rowsLenght = boardRowsSize,
    required this.piece,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: columnsLength * rowsLenght,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnsLength,
      ),
      itemBuilder: (context, index) {
        if (piece.position.contains(index)) {
          return Pixel(
            color: Colors.yellow,
            text: index.toString(),
          );
        } else {
          return Pixel(
            color: Colors.grey,
            text: index.toString(),
          );
        }
      },
    );
  }
}
