import 'package:flutter/material.dart';
import 'package:tetris/pieces/piece.dart';
import 'package:tetris/utils/board_utils.dart';
import 'package:tetris/widgets/pixel.dart';

class Board extends StatelessWidget {
  final double height;
  final double width;
  final Piece piece;
  final List<List<Color?>> ocupedPixels;
  const Board({
    super.key,
    required this.height,
    required this.width,
    required this.piece,
    required this.ocupedPixels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 3),
      color: Colors.white,
      child: GridView.builder(
        itemCount: boardColumnLenght * boardRowLenght,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: boardRowLenght, mainAxisExtent: height),
        itemBuilder: (context, index) {
          int row = getRowOfIndex(index);
          int column = getColumnOfIndex(index);
          double pixelWidth = width / boardRowLenght;
          double pixelHeight = height / boardColumnLenght;
          if (piece.currentPixels.contains(index)) {
            return Pixel(
              color: piece.color,
              width: pixelWidth,
              height: pixelHeight,
            );
          } else if (ocupedPixels[row][column] != null) {
            return Pixel(
              color: ocupedPixels[row][column]!,
              width: pixelWidth,
              height: pixelHeight,
            );
          } else {
            return Pixel(
              color: Colors.black,
              width: pixelWidth,
              height: pixelHeight,
            );
          }
        },
      ),
    );
  }
}
