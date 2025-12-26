// 함수에 반드시 파라미터 뒤에 async넣고, Future앞에는 await를 넣는다
/*
void main() {
  addNumbers(1, 1);
  addNumbers(2, 2);
}
void addNumbers(int num1, int num2) async {
  print('계산 시작 : $num1 + $num2');

  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $num1 + $num2 = ${num1 + num2}');
  });

  print('함수 완료');
}
*/

// 전체를 순서대로 하고 싶을 때
void main() async {
  // await를 붙이면 오류나는 이유는 addNumbers() 함수가 void라서
  // 수정 : 일반 함수를 Future함수로 변환 => Future<void>
  await addNumbers(1, 1);
  await addNumbers(2, 2);
}

Future<void> addNumbers(int num1, int num2) async {
  print('계산 시작 : $num1 + $num2');

  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $num1 + $num2 = ${num1 + num2}');
  });

  print('함수 완료');
}