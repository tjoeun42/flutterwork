// 비교 연산자 : <, >, ==, !=, <= ...
void main() {
  int num = 1;
  print(num is int);
  print(num is String);

  print(num is! int);

  String result = 10 < 20 ? '10이 더 작다' : '10이 더 크다';
  print(result);

  10 < 20 ? print('10이 더 작다') : print('10이 더 크다');
}