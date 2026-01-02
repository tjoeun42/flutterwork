import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  /*
  @override
  void initState() async {  // initState는 async를 쓸 수 없게 막아놨음
    super.initState();
    var result = await http.get(Uri.parse('https://itwon.store/flutter/data/data.json'));
    print('웹상의 json 출력 : ${result.body}');
  }
  */

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var result = await http.get(Uri.parse('https://itwon.store/flutter/data/data.json'));
    // print(result.body);

    // [{},{},{}] : json타입 -> List객체로 변환 [{map으로 들어옴},..]
    print(jsonDecode(result.body));

    var feedItems = jsonDecode(result.body);
    print(feedItems[0]['user']);
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
      body: [Home(), Text('Shop Page')][tab],
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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 3, itemBuilder: (c, i) {
      return Column(
        children: [
          // Image.asset('assets/img/profile1.jpg'),
          // 웹상의 이미지 가져오기
          Image.network('https://itwon.store/flutter/img/profile1.jpg'),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('좋아요 : 100'),
                Text('글쓴이'),
                Text('글내용')
              ],
            ),
          ),
        ],
      );
      }
    );
  }
}


