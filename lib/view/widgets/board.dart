import 'package:flutter/material.dart';
import 'package:tetris/model/pieces/piece.dart';
import 'package:tetris/utils/board_utils.dart';
import 'package:tetris/utils/my_colors.dart';
import 'package:tetris/view/widgets/pixel.dart';

class Board extends StatelessWidget {
  final double height;
  final Piece piece;
  final List<List<Color?>> ocupedPixels;

  const Board({
    super.key,
    required this.height,
    required this.piece,
    required this.ocupedPixels,
  });

  @override
  Widget build(BuildContext context) {
    var mainAxisExtent = (height * 0.96) / (boardColumnLenght + 1);
    return Container(
      height: height,
      color: MyColors.blueGrey,
      child: GridView.builder(
        itemCount: boardColumnLenght * boardRowLenght,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: boardRowLenght,
          mainAxisExtent: mainAxisExtent,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
        ),
        itemBuilder: (context, index) {
          int row = getRowOfIndex(index);
          int column = getColumnOfIndex(index);
          if (piece.currentPixels.contains(index)) {
            return Pixel(
              color: piece.color,
            );
          } else if (ocupedPixels[row][column] != null) {
            return Pixel(
              color: ocupedPixels[row][column]!,
            );
          } else {
            return const Pixel(
              color: MyColors.grey,
            );
          }
        },
      ),
    );
  }
}
