import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';
import 'package:tetris/utils/size_constants.dart';
import 'package:tetris/widgets/pixel.dart';

class Board extends StatelessWidget {
  final int columnsLength;
  final int rowsLenght;
  final Piece piece;
  final List<List<Color?>> ocupedPixels;
  const Board({
    super.key,
    this.columnsLength = boardColumnLenght,
    this.rowsLenght = boardRowLenght,
    required this.piece,
    required this.ocupedPixels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 3),
      color: Colors.white,
      child: GridView.builder(
        itemCount: columnsLength * rowsLenght,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: rowsLenght,
        ),
        itemBuilder: (context, index) {
          int row = getRowOfIndex(index);
          int column = getColumnOfIndex(index);

          if (piece.currentPixels.contains(index)) {
            return Pixel(
              color: piece.color,
              text: index.toString(),
            );
          } else if (ocupedPixels[row][column] != null) {
            //TODO: Não esta detectando os pixels ja pintados
            return Pixel(
              color: ocupedPixels[row][column]!,
              text: "*",
            );
          } else {
            return Pixel(
              color: Colors.black,
              text: index.toString(),
            );
          }
        },
      ),
    );
  }
}
