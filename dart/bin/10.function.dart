// 함수 반환형을 쓰지 않으면 void를 생략한 것
void main() {
  addNumbers();
  addNumbers2();  // 합계는 짝수, 합계는 홀수
}

addNumbers() {
  print('addNumbers 실행');
}

// 3개의 숫자를 변수에 넣고 모두 더한 값이 짝수인지 홀수인지 알려주는 함수
addNumbers2() {
  int x = 10;
  int y = 20;
  int z = 30;
  int sum = x + y + z;
  print('x : $x');
  print('y : $y');
  print('z : $z');

  if(sum % 2 == 0) {
    print('합계는 짝수');
    print('$x + $y + $z = 짝수');
  } else {
    print('합계는 홀수');
  }
}