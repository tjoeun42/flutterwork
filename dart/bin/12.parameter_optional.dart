// optional parameter : 있어도 되고 없어도 되는 파라미터. 대괄호를 묶는다
void main() {
  addNumbers(20);
  print('----------------------');
  addNumbers(20, 35, 56);
}

// addNumbers(int x, [int y, int z]) // 오류. non-nullable타입이기 때문(값을 안넣으면 null이 들어갈 수 있기 때문)

// 방법 1.
/*
addNumbers(int x, [int? y, int? z]) {
  y ??= 1;
  z ??= 1;
  int sum = x + y + z;

  if(sum % 2 == 0) {
    print('$x + $y + $z = 짝수');
  } else {
    print('$x + $y + $z = 홀수');
  }
}
*/

// 방법 2.
addNumbers(int x, [int y = 1, int z = 1]) {
  int sum = x + y + z;
  if(sum % 2 == 0) {
    print('$x + $y + $z = 짝수');
  } else {
    print('$x + $y + $z = 홀수');
  }
}