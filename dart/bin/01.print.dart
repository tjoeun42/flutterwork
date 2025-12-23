/*
자료형
1. bool(boolean이 아님) && , || 다 됨
2. int   ** int / int = double
3. double(float 없음)
4. String : "", '' 모두 가능
5. Null : null형만 가능

** print(같은 자료형만 넣을 수 있음)
 */

// 실행 단축키 : shift + F10 [맨 마지막 실행내용을 다시 실행]
//             ctrl + shift + F10 [현재 열려있는 파일 실행]
void main() {
  var name = 'kim';
  var num = 5;

  // 자료형 출력
  print(name.runtimeType);
  print(num.runtimeType);

  // 자료형이 다를 때는 따옴표를 반드시 넣어야 함
  print(name);
  // print(name + num);
  print('${name}' + '${num}');
  print(name + '${num}');
  print('${name} ${num}');

  // 중괄호 생략 가능. 문서에서도 권장.
  print('$name $num');
  print('$name' + '$num');

  // 반드시 중괄호를 해야할 상황
  print('$num.runtimeType $num');  // 결과 : 5.runtimeType 5
  print('${num.runtimeType} $num');  // 결과 : int 5
}