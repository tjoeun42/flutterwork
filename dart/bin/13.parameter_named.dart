// named parameter : 변수 이름 명시로 파라미터 순서가 필요 없다
void main() {
  addNumbers(x: 10, y: 20, z: 30);
  print('---------------------------');
  addNumbers(y: 100, x: 200, z: 300);
  print('===========================');
  addNumbers2(x: 10, y: 20);
  print('---------------------------');
  addNumbers2(y: 10, z: 20, x: 30);
}

// 파라미터 넣는 곳에 {}중괄호를 넣어주고, required를 붙인다
addNumbers({required int x, required int y, required int z}) {
  int sum = x + y + z;
  if(sum % 2 == 0) {
    print('$x + $y + $z = 짝수');
  } else {
    print('$x + $y + $z = 홀수');
  }
}

// reqyured를 빼면 optional parameter(값이 들어와도 되고, 안들어와도 됨)임.
addNumbers2({required int x, required int y, int z = 55}) {
  int sum = x + y + z;
  if(sum % 2 == 0) {
    print('$x + $y + $z = 짝수');
  } else {
    print('$x + $y + $z = 홀수');
  }
}