import 'package:flutter/material.dart';
// container 정렬
//  margin, padding, 정렬위젯(Align())

void main() {
  runApp(const MyApp());
}

/*
//  margin, padding
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
        body: Container(
          width: 100,
          height: 100,
          color: Colors.amberAccent,
          // margin: EdgeInsets.all(20),  전체마진
          margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
          padding: EdgeInsets.all(20),
          child: Text('본문 박스에 글씨 넣기'),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.thumb_up),
              Icon(Icons.emoji_events),
              Icon(Icons.shopping_cart)
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*
// Center로 body를 가운데로 넣기
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
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            padding: EdgeInsets.all(10),
            child: Text('본문 박스에 글자 씀'),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.thumb_up),
              Icon(Icons.emoji_events),
              Icon(Icons.shopping_cart)
            ],
          ),
        ),
      )
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
          appBar: AppBar(
              title: Text('예제'),
              backgroundColor: Color(0xfff3edf7)
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // width: 100,
              width: double.infinity,  // 폭의 전체 자리차지
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              padding: EdgeInsets.all(10),
              child: Text('본문 박스에 글자 씀'),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.thumb_up),
                Icon(Icons.emoji_events),
                Icon(Icons.shopping_cart)
              ],
            ),
          ),
        )
    );
  }
}
