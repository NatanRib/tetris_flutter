import 'package:flutter/material.dart';
import 'package:tetris/controller/store/game_store.dart';
import 'package:tetris/utils/my_colors.dart';
import 'package:tetris/controller/down_button_controller.dart';

class DownButton extends StatefulWidget {
  final Function downButtonFunction;
  const DownButton({
    super.key,
    required this.downButtonFunction,
  });

  @override
  State<DownButton> createState() => _DownButtonState();
}

class _DownButtonState extends State<DownButton> {
  late DownButtonController downButtonController;

  @override
  void initState() {
    downButtonController = DownButtonController(GameStore());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: MyColors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: const Icon(
          Icons.arrow_downward_rounded,
          color: MyColors.yellow,
          size: 50,
        ),
      ),
      onTapDown: (tap) =>
          downButtonController.initPress(widget.downButtonFunction),
      onTapUp: (tap) => downButtonController.cancelPress(),
      onTapCancel: () => downButtonController.cancelPress(),
    );
  }
}
