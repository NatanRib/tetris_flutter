import 'package:flutter/material.dart';
import 'package:tetris/utils/my_colors.dart';

class NavigationPageButton extends StatelessWidget {
  final String text;
  final Function navigateFunction;
  const NavigationPageButton({
    super.key,
    required this.text,
    required this.navigateFunction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.75,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: MyColors.yellowLight,
          backgroundColor: MyColors.blue,
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        onPressed: () => navigateFunction(),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
