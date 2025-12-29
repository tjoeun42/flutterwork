import 'package:flutter/material.dart';
/*
* Layout
  - Scaffold() : 화면을 top, body, bottom로 나누어줌
  - Row() : 위젯들을 가로로 배치
  - Column() : 위젯들을 세로로 배치
 */
void main() {
  runApp(const MyApp());
}
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('앱제목'), backgroundColor: Color(0xfff3edf7)),  // top부분
        body: Text('본문 내용'),     // body부분 : 필수
        bottomNavigationBar: BottomAppBar(child: Text('하단바')),  // bottom부분
      ),
    );
  }
}
*/

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          // 메인축 정렬
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // 메인의 반대축 정렬
          // crossAxisAlignment: CrossAxisAlignment.center, // 안되는 이유는 icon의 높이만큼만 자리차지하기 때문
          crossAxisAlignment: CrossAxisAlignment.stretch,   // 이거 하나만 됨.
          children: [
            Icon(Icons.ac_unit),
            Icon(Icons.adb_rounded),
            Icon(Icons.account_balance)
          ],
        ),
      ),
    );
  }
}
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.ac_unit),
            Icon(Icons.adb_rounded),
            Icon(Icons.account_balance)
          ],
        ),
      ),
    );
  }
}




