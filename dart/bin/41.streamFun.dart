/*
void main() {
  calculate(5).listen((val) {
    print('결과 : $val');
  });
}

Stream<int> calculate(int num) async* {
  for(int i=0; i<10; i++) {
    yield i*num;
  }
}
*/

/*
// 1초마다 리턴되게
void main() {
  calculate(5).listen((val) {
    print('결과 : $val');
  });
}

Stream<int> calculate(int num) async* {
  for(int i=0; i<10; i++) {
    yield i*num;

    await Future.delayed(Duration(seconds: 1));
  }
}
*/

/*
// 동시에 2개씩 실행
void main() {
  calculate(2).listen((val) {
    print('calculate(2) 결과 : $val');
  });

  calculate(3).listen((val) {
    print('calculate(3) 결과 : $val');
  });
}

Stream<int> calculate(int num) async* {
  for(int i=0; i<10; i++) {
    yield i*num;

    await Future.delayed(Duration(seconds: 1));
  }
}
 */

/*
// 1개가 끝나고 2번째거 실행되게
void main() {
  playAllStream().listen((val) {
    print(val);
  });
}

Stream<int> playAllStream() async* {
  yield* calculate(1);  // yield* : 해당되는 모든 값이 들어올때까지 기다리기
  yield* calculate(3);
}

Stream<int> calculate(int num) async* {
  for(int i=0; i<10; i++) {
    yield i*num;

    await Future.delayed(Duration(seconds: 1));
  }
}
*/

// 카운트하기 5, 4, 3, 2, 1
void main() async {
  print('카운트 시작');
  await countStream().listen((value) {
    print(value);
  });

/*
  // for는 꼭 필요하지 않지만 Stream을 순서대로 받는 기본 문법
  await for(int value in countStream()) {
    print(value);
  }
*/

  print('카운트 완료');
}
Stream<int> countStream() async* {
  for(int i=5; i>0; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

