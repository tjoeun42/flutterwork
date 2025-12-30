import 'package:flutter/material.dart';
/*
* dialog 창

* context : 커스텀위젯을 만들때마다 자동으로 하나가 만들어짐
   - 부모위젯들의 정보를 담고 있는 변수
   - 그리고 그 부모에는 반드시 MaterialApp()이 들어 있어야됨

  > context를 반드시 매개변수로 받아야 하는 위젯들
    - showDialog()
    - Navigator()
    - Theme.of()
    - Scaffold.of()
 */
void main() {
  runApp(
    MaterialApp(
        home: MyApp()
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name = ['이기쁨', '채규태', '이고잉', '송미영', '더조은'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(context);
            showDialog(
              context: context,
              builder: (context) {
                return CustomDialog();
              }
            );
          },
          child: Text(''),
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
                leading: Image.asset('assets/user${index+1}.png'),
                title: Text(name[index]),
              );
            },
        ),
        bottomNavigationBar: CustomBottom(),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(),
            TextButton(onPressed: (){}, child: Text('완료')),
            TextButton(onPressed: (){ Navigator.pop(context); }, child: Text('취소'))
          ],
        ),
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
