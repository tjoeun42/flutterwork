import 'package:flutter/material.dart';
/*
1. 1단계
     TextField에 글씨 넣지 않고 그냥 완료버튼만 누르면 name에
        이름 추가하기
     부모위젯의 name state를 변경
     1.1 수정함수
     1.2 함수를 보내고, 등록하고, 사용하기

2. 2단계
     input 데이터를 변수에 저장하여 보내기
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
  var name = ['이기쁨', '채규태', '이고잉'];

/*
  // 1.1 수정함수 만들기
  addName() {
    setState(() {
      name.add('나생성');
    });
  }
*/

  // 2.1 수정함수 만들기
  addName(inputName) {
    setState(() {
      name.add(inputName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(context);
          showDialog(
            context: context,
            builder: (context) {
// 1.2. 자식에게 함수 보내기.  2.2 동일
              return CustomDialog(addName : addName);
            }
          );
        },
        child: Text('Dialog'),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xfff3edf7),
        leading: Icon(Icons.list),
        title: Text('주소록'),
        actions: [Icon(Icons.search), Icon(Icons.share)],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: name.length,
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

// 1.3 등록.  2.3 동일
class CustomDialog extends StatelessWidget {
  CustomDialog({super.key, this.addName});
  final addName;

  // 2.4 input데이터를 저장할 변수
  var inputData = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            // 2.5 받은 이름 변수에 저장
            TextField(onChanged: (text){ inputData = text; }),

            // 1.4 사용하기
            // TextButton(onPressed: (){addName(); Navigator.pop(context);}, child: Text('완료')),

            // 2.6 사용하기
            TextButton(onPressed: (){addName(inputData); Navigator.pop(context);}, child: Text('완료')),
            TextButton(onPressed: (){Navigator.pop(context);}, child: Text('취소'))
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