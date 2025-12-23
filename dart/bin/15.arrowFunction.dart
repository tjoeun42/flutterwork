void main() {
  int result = addNumbers2(25, y: 48, z: 75);
  print('반환값 : $result');

  result = addNumbers2(24, y: 37);
  print('반환값 : $result');

  result = addNumbers2(14, z: 28, y:47);
  print('반환값 : $result');
}

int addNumbers(int x, {required int y, int z = 37}) {
  return x + y + z;
}

int addNumbers2(int x, {required int y, int z = 37}) => x + y + z;