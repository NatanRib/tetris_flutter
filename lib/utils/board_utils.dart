const boardColumnLenght = 18;
const boardRowLenght = 10;

int getRowOfIndex(int index) {
  return (index / boardRowLenght).floor();
}

int getColumnOfIndex(int index) {
  return index % boardRowLenght;
}
