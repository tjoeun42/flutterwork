import 'package:flutter/material.dart';
import './style.dart' as style;
/*
* 탭 만들기(Tab widget있지만 나중에 커스터마이징을 하려면 알아야됨)
  1. state에 tab의 현재상태 저장
  2. state에 따라 tab이 어떻게 보일지 작성
  3. 유저가 쉽게 state 조작할 수 있게 조작 기능
 */
void main() {
  runApp(
    MaterialApp(
      theme: style.theme,
      home: const MyApp()
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Instargram'),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.add_box_outlined)
          )
        ],
      ),
      body: [Text('Home Page'), Text('Shop Page')][tab],
      bottomNavigationBar: BottomNavigationBar(
        // label의 글씨 안보이게 하려면
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        onTap: (i) {
          print(i);
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Shop')
        ]
      ),
    );
  }
}

