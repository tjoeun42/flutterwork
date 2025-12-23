/*
 * 기존 프로그램과 동일
   - +, -, *, ++, -- , +=, %= ...
 * 다른것
   - 나눗셈 : int / int = double
   - 몫 : ~/

 * ??= : 만약 값이 null이면 오른쪽에 있는 값을 변수에 저장하고
                  null이 아니면 왼쪽값을 저장
 */

void main() {
  int num1 = 8;
  int num2 = 2;
  // int result = num1 / num2;  // 오류 : 결과는 무조건 double형
  double result = num1 / num2;
  print(result);

  int num3 = 3;
  print('몫 : ${num1 ~/ num3}');

  int? num4 = 2;
  print(num4);

  num4 = null;
  print(num4);

  num4 ??= 5;   // num4가 null이므로 오른쪽의 값(5) 을 num4에 값을 넣음
  print(num4);

  num4 ??= 20;  // num4에 5가 들어있으므로 왼쪽의 값(원래 변수의값 5)를 넣음
  print(num4);

  /*
  ? : 자료형에 붙여줌. null값 허용
  ?? : 변수에 붙여줌. null일때 기본값 제공(원본 안바뀜)
  ??= : 변수에 붙여줌. null일때 기본값 제공(원본이 바뀜)
   */
}