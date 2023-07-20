import 'package:tetris/model/store/game_store.dart';

class HomeController {
  void resumeGame() {
    GameStore.isPaused = false;
  }
}
