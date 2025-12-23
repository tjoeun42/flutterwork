/*
  * final과 const
    - 공통점 : 상수, 자료형 생략 가능
    - 차이점 : final은 bulid time에서 값을 몰라도 됨
              const는 bulid time에 미리 값을 알아야 됨
 */
void main() {
  final String name1 = 'kim';
  const String name2 = 'hong';

  DateTime now1 = DateTime.now();
  print(now1);

  final DateTime fNow = DateTime.now();
  print(fNow);

  // const DateTime cNow = DateTime.now();  // build시 시간을 알 수 없음.
  // print(cNow);
}