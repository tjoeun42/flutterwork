import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff3edf7),
          title: Text('강남역'),
          actions: [Icon(Icons.search), Icon(Icons.menu), Icon(Icons.notification_add)],  // 오른쪽
        ),
        body: Container(
          child: Row(
            children: [
              Image.asset('assets/cat.png', width: 100,),
              SizedBox(
                child: Column(
                  children: [
                    Text('고양이 집사 구함'),
                    Text('개냥이, 활발한 성격'),
                    Text('금액은 만나서 결정'),
                    Row(
                      children: [
                        Icon(Icons.favorite_border),
                        Text('4')
                      ],
                    )
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

