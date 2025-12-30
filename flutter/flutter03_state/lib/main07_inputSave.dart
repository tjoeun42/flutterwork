import 'package:flutter/material.dart';
/*
* input 데이터 사용
  TextField()위젯은 저장되지 않음. 변수에 저장해야됨
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
  var total = 5;

  addFriend() {
    setState(() {
      total++;
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
                return CustomDialog(friendState : addFriend);
              }
            );
          },
          child: Text(''),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xfff3edf7),
          leading: Icon(Icons.list),
          title: Text(total.toString()),
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

class CustomDialog extends StatelessWidget {
  // 1. const 지우기
  /* const */ CustomDialog({super.key, this.friendState});
  final friendState;

  // 2. 변수 만들기
  var inputData = TextEditingController();

  // 5. onChanged를 이용하여 변수에 저장하기
  var inputData2 = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            /*
// 3. 변수에 저장 (constroller : 변수명)  : 실시간 출력 안됨
            TextField(controller: inputData),
            TextButton(onPressed: (){
                print(inputData.text);
              },
              child: Text('콘솔에 입력값 출력')
            ),
            */
// 4. onChanged 사용하여 실시간 으로 출력 넣기
            // TextField(onChanged: (text){ print(text);}),

// 5. onChanged 사용하여 실시간으로 변수에 저장하기
            TextField(onChanged: (text){ inputData2 = text; },),
            TextButton(onPressed: (){friendState(); print(inputData2); }, child: Text('완료')),
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
