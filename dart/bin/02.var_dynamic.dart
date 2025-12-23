/*
1. var 타입 : 처음 들어온값이 type이 됨. type이 정해지면 바꿀수 없다
2. dynamic 타입 : 처음 들어온값이 type이 됨. 처음 타입과 상관없이 타입을 바꿀 수 있다.
 */
void main() {
  var name = 'hong';
  name = 'gil';
  // name = 5;  // 타입을 달라서 넣을 수 없음

  dynamic number = 5;
  print(number);

  number = 'dong';
  print(number);

  dynamic bool1 = true;
  print(bool1);

  bool1 = false;
  bool1 = 'true';
  bool1 = 67;
}