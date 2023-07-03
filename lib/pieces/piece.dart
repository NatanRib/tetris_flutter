import 'package:tetris/utils/size_constants.dart';

abstract class Piece {
  abstract List<int> position;

  void moveDown() {
    print('entra moveDow position ${position}');
    // position.forEach((element) {
    //   element += boardColumnsSize;
    // });
    for (var i = 0; i < position.length; i++) {
      position[i] += boardColumnsSize;
    }
    print('sai moveDow position ${position}');
  }
}
