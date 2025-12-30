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





