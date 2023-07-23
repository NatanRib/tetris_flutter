import 'dart:async';

import 'package:tetris/controller/store/game_store.dart';

class DownButtonController {
  GameStore gameStore;

  DownButtonController(this.gameStore);
  bool pressed = false;

  void initPress(Function downButtonFunction) {
    pressed = true;
    gameStore.stopButtonDown = false;
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (pressed && !gameStore.stopButtonDown) downButtonFunction();
    });
  }

  void cancelPress() {
    pressed = false;
  }
}
