// 반환값
void main() async {
  final result = await addNumbers(3, 3);
  print('결과 : $result');
}

Future<int> addNumbers(int num1, int num2) async {
  print('계산 시작 : $num1 + $num2');

  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $num1 + $num2 = ${num1 + num2}');
  });

  print('함수 완료');
  return num1 + num2;
}