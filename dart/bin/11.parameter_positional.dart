// positional parameter : 순서를 지키는 파라미터
void main() {
  addNumbers(10, 23, 30);
}

addNumbers(int x, int y, int z) {
  int sum = x + y + z;
  if(sum % 2 == 0) {
    print('$x + $y + $z = 짝수');
  } else {
    print('$x + $y + $z = 홀수');
  }
}