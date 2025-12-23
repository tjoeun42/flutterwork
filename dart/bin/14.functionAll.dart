void main() {
  int result = addNumbers(25, y: 48, z: 75);
  print('반환값 : $result');

  result = addNumbers(24, y: 37);
  print('반환값 : $result');

  result = addNumbers(14, z: 28, y:47);
  print('반환값 : $result');
}

int addNumbers(int x, {required int y, int z = 37}) {
  int sum = x + y + z;
  if(sum % 2 == 0) {
    print('$x + $y + $z = 짝수');
  } else {
    print('$x + $y + $z = 홀수');
  }
  return sum;
}