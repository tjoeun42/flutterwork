/*
* 비동기 처리
  - Future, Stream
  - 다른점 : Future는 1번만 응답받을 때 사용, Stream은 여러번 응답 받을 때 사용
    > 1회만 응답 받을 때 : async / await / Future
    > 지속적으로 응답 받을 때 : async* / yield / Stream

  - 사용
    > 서버에서 데이터를 가져올 때
    > 파일 읽을 때
    > 계산이 오래 걸리는 작업

* Future : javascript의 Promise와 동일
          싱글스레드 환경에서 비동기 처리를 위해 사요
          * javascript의 Promise는 특정 작업이 완료되면 다음작업을 수행하겠다는 약속
          * Dart Future는 미래에 완료될 작업을 나타내는 객체(나중에 결과 받기)
 */

void main() {
  Future<String> name = Future.value('tjoeun');
  Future<int> num = Future.value(7);
  Future<bool> isTrue = Future.value(true);
  /*
  Future.delayed(Duration(seconds: 2), () {
    print('Delay 끝');
  });
   */
  addNumbers(1, 1);
  addNumbers(2, 2);
}

void addNumbers(int num1, int num2) {
  print('계산 시작 : $num1 + $num2');

  Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $num1 + $num2 = ${num1 + num2}');
  });

  print('함수 완료');
}