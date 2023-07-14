import 'package:flutter/material.dart';
import 'package:tetris/widgets/down_button_controller.dart';

class DownButton extends StatefulWidget {
  final Function downButtonFunction;
  const DownButton({super.key, required this.downButtonFunction});

  @override
  State<DownButton> createState() => _DownButtonState();
}

class _DownButtonState extends State<DownButton> {
  DownButtonController downButtonController = DownButtonController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Icon(
        Icons.arrow_downward_rounded,
        color: Colors.white,
        size: 50,
      ),
      onTapDown: (tap) =>
          downButtonController.initPress(widget.downButtonFunction),
      onTapUp: (tap) => downButtonController.cancelPress(),
      onTapCancel: () => downButtonController.cancelPress(),
    );
  }
}
