import 'package:flutter/material.dart';
import 'package:tetris/model/pieces/piece.dart';
import 'package:tetris/utils/board_utils.dart';
import 'package:tetris/utils/my_colors.dart';
import 'package:tetris/view/widgets/pixel.dart';

class Board extends StatelessWidget {
  final Piece piece;
  final List<List<Color?>> ocupedPixels;

  const Board({
    super.key,
    required this.piece,
    required this.ocupedPixels,
  });

  @override
  Widget build(BuildContext context) {
    var aspectRatio = MediaQuery.sizeOf(context).aspectRatio * 2.2;
    var itemCount = boardColumnLenght * boardRowLenght;
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: boardRowLenght,
      childAspectRatio: aspectRatio,
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      children: List.generate(
        itemCount,
        (index) {
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
