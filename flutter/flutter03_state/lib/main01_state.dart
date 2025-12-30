import 'package:flutter/material.dart';
/*
* state (변수)
  - 일반 변수와 다른 점 : 변경이 되면 재 렌더링해줌
  - state를 쓰려면 StatefulWidget 안에서 사용
 */
void main() {
  runApp(MyApp());
}

/*
class MyApp extends StatelessWidget {
  MyApp({super.key});
  // const로 만들어진 위젯의 모든 필드는 final이어야 됨
  // final num = 1;
  // 아니면 const를 빼고, 일반 변수를 만들던지
  var num = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            print(num);   // 콘솔은 숫자 증가
            num++;
          },
          child: Text(num.toString()),  // 숫자 증가 안함. 재렌더링이 안되서
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
                  leading: Image.asset('assets/user1.png'),
                  title: Text('친구 $index')
              );
            }
        ),
        bottomNavigationBar: CustomBottom(),
      ),
    );
  }
}
*/

// state 사용 -> stful로 자동생성하면 StatefulWidget() 생성됨
//  재렌더링이 필요한 값은 setState(){} 안에 넣으면 됨.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var num = 1;

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
                  leading: Image.asset('assets/user1.png'),
                  title: Text('친구 $index')
              );
            }
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

