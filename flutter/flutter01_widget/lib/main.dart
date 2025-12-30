import 'package:flutter/material.dart';
/*
* Flexible() 위젯 : flex와 비슷
  : 전체에서 ?% 자리차지 같은 것 사용할 때 편리
    - Row(), Column() 에서 사용

* Expanded() : 나머지 부분 다 자리차지
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
        appBar: AppBar(
          backgroundColor: Color(0xfff3edf7),
          title: Text('강남역'),
          actions: [
            Icon(Icons.search), 
            SizedBox(width: 10), 
            Icon(Icons.menu), 
            SizedBox(width: 10), 
            Icon(Icons.notification_add),
            Padding(padding: EdgeInsets.only(right: 16))
          ],  // 오른쪽
        ),
        body: Row(  // Column도 사용 가능
          children: [
            // Flexible(child: Container(color: Colors.blueGrey), flex:3),
            // Flexible(child: Container(color: Colors.lightGreen), flex: 7)

            Flexible(child: Container(color: Colors.lime), flex: 3),
            Flexible(child: Container(color: Colors.amberAccent), flex: 3),
            Flexible(child: Container(color: Colors.lightBlueAccent), flex: 3),
          ],
        ),
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
        appBar: AppBar(
          backgroundColor: Color(0xfff3edf7),
          title: Text('강남역'),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Icon(Icons.menu),
            SizedBox(width: 10),
            Icon(Icons.notification_add),
            Padding(padding: EdgeInsets.only(right: 16))
          ],  // 오른쪽
        ),
        body: Row(
          children: [
            Expanded(child: Container(color: Colors.lightBlue,)),
            Container(width: 100, color: Colors.amber,)
          ],
        ),
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
        appBar: AppBar(
          backgroundColor: Color(0xfff3edf7),
          title: Text('강남역'),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Icon(Icons.menu),
            SizedBox(width: 10),
            Icon(Icons.notification_add),
            Padding(padding: EdgeInsets.only(right: 16))
          ],  // 오른쪽
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/cat.png', width: 150,),
              SizedBox(width: 30,),
              // 이미지를 넣고 남은 공간 모두 자리차지
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Text('고양이 집사 구함', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    Text('개냥이, 활발한 성격'),
                    Text('금액은 만나서 결정', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite_border),
                          Text('4')
                        ],
                      ),
                  ],
                ),
              )
            ],
          ),
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
        appBar: AppBar(
          backgroundColor: Color(0xfff3edf7),
          title: Text('강남역'),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Icon(Icons.menu),
            SizedBox(width: 10),
            Icon(Icons.notification_add),
            Padding(padding: EdgeInsets.only(right: 16))
          ],  // 오른쪽
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: Image.asset('assets/cat.png'), flex: 4,),
              SizedBox(width: 30),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Text('고양이 집사 구함', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    Text('개냥이, 활발한 성격'),
                    Text('금액은 만나서 결정', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                    SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite_border),
                          Text('4')
                        ],
                      ),
                    )
                  ],
                ), flex: 6)
            ],
          ),
        ),
      ),
    );
  }
}