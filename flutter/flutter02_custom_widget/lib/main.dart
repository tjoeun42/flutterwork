import 'package:flutter/material.dart';
/*
* ListView() 위젯
  : 같은 위젯이 반복적으로 들어갈 때(반복문을 써도 되지만 좋은 위젯이 있음)
  - 스크롤바 생김
  - 스크롤의 위치 감시 기능
  - 메모리 절약기능(ListView.builder 일때) : 스크롤을 아래로 내리면 위쪽의 가려지는 부분은 메모리에서 삭제
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
        appBar: AppBar(),
        body: Column(
          children: [
            Text('안녕', style: TextStyle(fontSize: 100)),
            Text('안녕', style: TextStyle(fontSize: 100)),
            Text('안녕', style: TextStyle(fontSize: 100)),
            Text('안녕', style: TextStyle(fontSize: 100)),
            Text('안녕', style: TextStyle(fontSize: 100)),
            Text('안녕', style: TextStyle(fontSize: 100)),
            Text('안녕', style: TextStyle(fontSize: 100)),
            Text('안녕', style: TextStyle(fontSize: 100)),
            Text('안녕', style: TextStyle(fontSize: 100)),
            Text('안녕', style: TextStyle(fontSize: 100)),
          ],
        )
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
        appBar: AppBar(backgroundColor: Color(value),),
      ),
    );
  }
}



