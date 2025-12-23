/*
* Null safety타입 : 2.12버전부터 도입
  - 기본값 초기화없이 선언하는 변수는 null값에 대한 안정성을 보장하기 위해
    타입을 모든 변수는 nullable과 non-nullable로 구분해 줘야 한다.
    1. nullable type : null을 허용하는 타입
       > 자료형 뒤에 ?를 붙여 사용
    2. non-nullable : null을 허용하지 않는 타입
       > 아무것도 붙이지 않으면 non-nullable
 */
void main() {
  String name = 'kim';
  print(name);

  // name = null;  // 오류 : non-nullable 타입

  String? name2 = 'ji'; // 자료형 옆에 ?를 넣으면 null을 넣을 수 있음
  name2 = null;
  print(name2);

  int? num = 2; // 모든 자료형에 null을 넣을 수 있음
  num = null;
  print(num);

/*
   ! : nullable type으로 선언했을 때
       변수 뒤에 !를 붙여서 null인경우 오류를 발생하도록 만듬
       - 변수명에 !를 붙이면, non-nullable의 타입이라는 뜻
 */

  String? name3 = 'won';
  print(name3);
  print(name3!);

  name3 = null;
  print(name3);
  // print(name3!);  // 실행시 오류

  int? num1;
  int num2 = 3;
  // print(num1 + num2);  // 타입이 달라서 build 오류
  // print(num1! + num2);  // 오류 num1이 null값 연산 불가

  // ?? : null일 때 대체값 사용. 변수의 값은 변하지 않음
  print(num1 ?? 5);
  print(num1 ?? 7 + num2);
  // 대체적으로 괄호로 묶어 사용 => print((num1 ?? 7) + num2);
  print(num1);

  // if문을 null safety를 이용하여 ?. 으로 사용할 수 있음
  String? name4 = "john";
  if(name4 != null) {
    print(name4.isNotEmpty);
  }

  print(name4?.isEmpty);
  print(name4?.isNotEmpty);

  name4 = null;
  print(name4?.isEmpty);
  print(name4?.isNotEmpty);
}