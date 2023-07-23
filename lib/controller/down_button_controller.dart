import 'dart:async';

class DownButtonController {
  bool pressed = false;

  void initPress(Function downButtonFunction) {
    pressed = true;
    Timer.periodic(const Duration(milliseconds: 250), (timer) {
      if (pressed) downButtonFunction();
    });
  }

  void cancelPress() {
    pressed = false;
  }
}
