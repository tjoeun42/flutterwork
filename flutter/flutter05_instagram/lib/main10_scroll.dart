import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';    // 스크롤관련 유용한 함수들이 들어 있음.

// * 무한 스크롤 : 화면의 맨 하단에 닿았으면 데이터를 서버에게 가져와서 보여주는 역할

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
  var tab = 0;
  var feedItems = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await Future.delayed(Duration(seconds: 2));
    var result = await http.get(Uri.parse('https://itwon.store/flutter/data/data.json'));
    if(result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      setState(() {
        feedItems = result2;
      });
    } else {
      throw Exception('서버에서 가져오기 실패');
    }
  }

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
      body: [Home(feedItems: feedItems), Text('Shop Page')][tab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
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

// StatefulWidget 이어야 함. 데이터가 바뀌어서
class Home extends StatefulWidget {
  const Home({super.key, this.feedItems});
  final feedItems;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scroll = ScrollController(); // 스크롤바 위치를 기록해주는 함수

  @override
  void initState() {
    super.initState();

    // 스크롤 이벤트 리스너를 등록(1번만 등록해줌)
    scroll.addListener((){    // 스크롤이 움직일때 마다 호출됨
      // print('스크롤위치 변경됨');
      // print(scroll.position.pixels);  // 스크롤이 위에서부터 얼마나 내려왔는지 높이
      // print(scroll.position.maxScrollExtent);  // 스크롤을 최대로 내릴수 있는 높이
      // print(scroll.position.userScrollDirection); // 스크롤이 되는 방향
      if(scroll.position.pixels == scroll.position.maxScrollExtent) {
        print('맨 밑까지 스크롤 함');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    if(widget.feedItems.isNotEmpty) {
      // 스크롤이 움직일 때마다 스크롤 위치정보들을 scroll변수에 기록
      return ListView.builder(itemCount: 3, controller: scroll, itemBuilder: (c, i) {
        return Column(
          children: [
            Image.network(widget.feedItems[i]['image']),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('좋아요 : ${widget.feedItems[i]['likes']}'),
                  Text('글쓴이 : ${widget.feedItems[i]['user']}'),
                  Text('내용 : ${widget.feedItems[i]['content']}')
                ],
              ),
            ),
          ],
        );
      }
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}


