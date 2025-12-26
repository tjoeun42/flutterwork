// Pattern Matching : 자료형 매칭
void main() {
  final minJi = ('민지', 20);
  final (name as String, age as int) = minJi;
  // final (name as int, age as int) = minJi;  // runTime 오류
  print(name);
  print(age);

  /*
  switchar('abc');
  switchar(['1', '2']);

  switchar([1,2]);
  switchar(['1','2','3']);
  switchar([1,2,3]);
  switchar(['1',2,true]);
  switchar([1,2,3,4]);

  switchar([5,7]);
  switchar([7,'9']);
  */

  switchar(20);
  switchar(8);
}

void switchar(dynamic anything) {
  switch(anything) {
    case 'abc' :
      print('match : abc');
    case ['1', '2'] :
      print('match : [1, 2]');
    case [_, _, _] :    // 자료형과 관계없어 갯수만 맞으면 됨
      print('match : [_, _, _]');
    // int형의 갯수가 2개인 것만 받고 싶어요
    case [int a, int b] :
      print('match : [int : $a, int : $b]');
    case < 10 && > 5 :
      print('match : 5보다 크고 10보다 작은 숫자');
    default :
      print('no match');
  }
}