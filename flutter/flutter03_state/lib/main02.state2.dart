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
        // 위, 아래 간격 넣을려면
        body: ListView.separated(
          padding: EdgeInsets.all(10),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Image.asset('assets/user${index+1}.png'),
                title: Text(name[index])
            );
          },
          /*
          separatorBuilder: (context, index) {
              return SizedBox(height: 10);
          },
          */
          separatorBuilder:(context, index) => SizedBox(height: 10)
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
