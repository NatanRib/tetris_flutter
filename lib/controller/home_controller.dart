import 'package:tetris/controller/store/game_store.dart';

class HomeController {
  GameStore store;

  HomeController(this.store);

  void newGame() {
    store.isGameOver = false;
    store.isPaused = false;
  }
}
