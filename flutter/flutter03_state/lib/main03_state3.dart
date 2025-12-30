import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var num = 1;
  var name = ['이기쁨', '채규태', '이고잉', '송미영', '더조은'];
  // 1. state 만들기
  var like = [0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              num++;
            });
          },
          child: Text(num.toString(), style: TextStyle(fontSize: 20)),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xfff3edf7),
          leading: Icon(Icons.list),
          title: Text('주소록'),
          actions: [Icon(Icons.search), Icon(Icons.share)],
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                // 2. 이미지를 글자 위젯바꾸기
                leading: Text(like[index].toString()),
                title: Text(name[index]),
                // 3. 버튼 생성 -> setState()에 재렌더링될 값 넣기
                trailing: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      like[index]++;
                    });
                  },
                  child: Text('좋아요')
                ),
              );
            },
        ),
        bottomNavigationBar: CustomBottom(),
      ),
    );
  }
}

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.phone),
          Icon(Icons.article_outlined),
          Icon(Icons.contacts)
        ],
      ),
    );
  }
}
