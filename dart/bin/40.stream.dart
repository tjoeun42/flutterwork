/*
- Stream : 스트림을 내가 닫을 때까지 계속 값을 받을 수 있다
         import필요

  * StreamController : 스트림을 관리하는 관리자
    - stream : 스트림에 값이 들어오면 받는 역할(1번만 스트림 사용)
    - listen : stream에 있는 값을 출력
    - sink : 트림에 값을 보내는 역할
*/

import 'dart:async';
/*
void main() {
  final controller = StreamController();
  final stream = controller.stream;

  final streamListener = stream.listen((val) {
    print('Listener 1 : $val');
  });

  controller.sink.add(1);
  controller.sink.add(2);
}
*/

// asBroadcastStream() : 여러번 스트림 사용
void main() {
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.listen((val) {
    print('Listener 1 : $val');
  });

  final streamListener2 = stream.listen((val) {
    print('Listener 2 : $val');
    print('--------------------------------');
  });

  controller.sink.add(1);
  controller.sink.add(2);
}