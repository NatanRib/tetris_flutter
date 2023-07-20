import 'package:flutter/material.dart';
import 'package:tetris/utils/my_colors.dart';

class NavigationPageButton extends StatelessWidget {
  final String text;
  final Widget navigateTo;
  final Function? secundaryFunction;
  const NavigationPageButton({
    super.key,
    required this.text,
    required this.navigateTo,
    this.secundaryFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => navigateTo,
          ),
        );
        if (secundaryFunction != null) secundaryFunction!();
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
