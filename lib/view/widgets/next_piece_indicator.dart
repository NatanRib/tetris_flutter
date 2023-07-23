import 'package:flutter/material.dart';
import 'package:tetris/model/pieces/piece.dart';
import 'package:tetris/utils/my_colors.dart';
import 'package:tetris/view/widgets/pixel.dart';

class NextPieceIndicator extends StatelessWidget {
  final double height;
  final double width;
  final Piece nextPiece;
  const NextPieceIndicator({
    super.key,
    required this.nextPiece,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    var boardHeight = height * 0.40;
    return Container(
      color: MyColors.blueGrey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Text(
              "Next:",
              style: TextStyle(
                color: MyColors.yellow,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: boardHeight,
            width: width,
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 0.5,
              crossAxisSpacing: 0.5,
              childAspectRatio: width / boardHeight,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                9,
                (index) {
                  if (nextPiece.decreasedPixels.contains(index)) {
                    return Pixel(
                      radius: 4,
                      color: nextPiece.color,
                    );
                  } else {
                    return const Pixel(
                      radius: 4,
                      color: MyColors.grey,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
