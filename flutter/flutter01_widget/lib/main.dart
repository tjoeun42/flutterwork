import 'package:flutter/material.dart';
// SizeBox() : 간단한 박스
//  - 속성 : width, height, child 3개만 있음.
//    > 많은 속성이 필요하면 Container사용

// style() : 위젯에 대한 스타일 넣기

void main() {
  runApp(const MyApp());
}

/*
// SizeBox() 사용
// Text()위젯에 스타일 넣어주기
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('예제'),
            backgroundColor: Color(0xfff3edf7)
        ),
        body: SizedBox(
          // Text()위젯에 스타일 넣어주기
          child: Text('안녕',
            style: TextStyle(
              color: Color(0xff04cece),
              fontSize: 50,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}
*/

/*
// 아이콘 스타일
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('예제'),
            backgroundColor: Color(0xfff3edf7)
        ),
        body: SizedBox(
          child: Icon(
            Icons.ac_unit_outlined,
            color: Colors.pinkAccent,
            size: 50,   // 기본사이즈 : 24
          ),
        ),
      ),
    );
  }
}*/

/*
// 버튼
//  - TextButton(), IconButton(), ElevatedButton()
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('예제'),
            backgroundColor: Color(0xfff3edf7)
        ),
        body: SizedBox(
          // child: TextButton(onPressed: (){}, child: Text('TextButton')),
          // child: ElevatedButton(onPressed: (){}, child: Text('ElevatedButton')),
          child: IconButton(
              onPressed: (){
                // 클릭시 실행할 코드
              },
              icon: Icon(
                Icons.favorite,
                size: 50,
                color: Colors.purple,
              )
          ),
        ),
      ),
    );
  }
}
*/

