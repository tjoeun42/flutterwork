import 'package:flutter/material.dart';
/*
* state (변수)
  - 일반 변수와 다른 점 : 변경이 되면 재 렌더링해줌
  - state를 쓰려면 StatefulWidget 안에서 사용
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Text('버튼'),
        ),
      ),
    );
  }
}


