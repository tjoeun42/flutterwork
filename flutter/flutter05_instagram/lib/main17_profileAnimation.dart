import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/*
* GestureDetector() : 제스쳐(터치 이벤트)를 감지할 수 있도록 도와주는 위젯
                    속성                |          설명
  ---------------------------------------------------------------
  onTap                                 | 한 번 탭했을 때
  onDoubleTap                           | 두 번 탭했을 때
  onLongPress                           | 길게 눌렀을 때
  onPanUpdate                           | 드래그할 때 위치 변화 감지
  onHorizontalDragStart / Update / End  | 가로 드래그
  onVerticalDragStart / Update / End    | 세로 드래그

 * 커스텀 페이지 전환 애니메이션 : PageRouteBuilder()
   - 에니메이션 위젯
     FadeTransition()
     PositionalTransition()
     ScaleTransition()
     Rotation Transition()
     Slide Transition()
*/

void main() {
  runApp(
    MaterialApp(
      theme: style.theme,
      home: const MyApp(),
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
  var feedItems = [];
  var userImage;
  var userContent;

  setUserContent(newContent) {
    setState(() {
      userContent = newContent;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var result = await http.get(Uri.parse('https://itwon.store/flutter/data/data.json'));
    if(result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      setState(() {
        feedItems = result2;
      });
    } else {
      throw Exception('서버에서 가져오기 실패');
    }
  }

  addData(a) {
    setState(() {
      feedItems.addAll(a);
    });
  }

  addMyData() {
    String formattedData = DateFormat('MMM dd').format(DateTime.now());
    var myData = {
      "id": feedItems.length,
      "image": userImage,
      "likes": 0,
      "date": formattedData,
      "content": userContent,
      "liked": false,
      "user": "John Kim"
    };
    setState(() {
      feedItems.insert(0, myData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Instargram'),
        actions: [
          IconButton(
            onPressed: () async {
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if(image != null) {
                setState(() {
                  userImage = File(image.path);
                });
              }
              Navigator.push(context, MaterialPageRoute(builder: (context) => Upload(
                userImage: userImage,
                setUserContent: setUserContent,
                addMyData : addMyData
              )));
            },
            icon: Icon(Icons.add_box_outlined)
          )
        ],
      ),
      body: [Home(feedItems: feedItems, addData: addData), Text('Shop Page')][tab],
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

class Home extends StatefulWidget {
  const Home({super.key, this.feedItems, this.addData});
  final feedItems;
  final addData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scroll = ScrollController();

  bool isLoading = false;
  bool hasMore = true;
  int page = 1;

  getMore() async {
    if(isLoading || !hasMore) return;

    isLoading = true;
    var result = await http.get(Uri.parse('https://itwon.store/flutter/data/data$page.json'));
    if(result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
        if(result2.isEmpty) {
          hasMore = false;
        } else {
          widget.addData(result2);
          page++;
        }
    } else {
      hasMore = false;
      throw Exception('서버에서 가져오기 실패');
    }
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    scroll.addListener((){
      if(scroll.position.pixels >= scroll.position.maxScrollExtent-100) {
        getMore();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if(widget.feedItems.isNotEmpty) {
      return ListView.builder(itemCount: widget.feedItems.length, controller: scroll, itemBuilder: (c, i) {
        return Column(
          children: [
            widget.feedItems[i]['image'].runtimeType == String 
            ? Image.network(widget.feedItems[i]['image'])
            : Image.file(widget.feedItems[i]['image'], height: 400, width: double.infinity, fit: BoxFit.cover),

            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('좋아요 : ${widget.feedItems[i]['likes']}'),
                  GestureDetector(
                    child: Text('글쓴이 : ${widget.feedItems[i]['user']}'),
                    onTap: () {
                      Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => Profile())
                        // CupertinoPageRoute(builder: (context) => Profile())
                        /* 사용자 전환 애니메이션 사용
                        PageRouteBuilder(pageBuilder: (context, a1, a2){},
                              a1 : 새 페이지 전환의 진행 정도 0~1
                              a2 : 기존 페이지 전환의 진행 정도
                            transitionsBuilder: (context, a1, a2, child){}
                              child : 새로 띄울 페이지
                        )
                        */
                        PageRouteBuilder(pageBuilder: (context, a1, a2) => Profile(),
                          /*  Fade In 애니메이션
                          transitionsBuilder: (context, a1, a2, child) => FadeTransition(opacity: a1, child: child),
                          transitionDuration: Duration(milliseconds: 1000)
                          */

                          // Slide 애니메이션
                          transitionsBuilder: (context, a1, a2, child) =>
                            SlideTransition(position: Tween(
                              begin: Offset(1.0, 0.0),
                              end: Offset(0.0, 0.0)
                            ).animate(a1),
                              child: child,
                            )
                        )
                      );
                    },
                  ),
                  Text('내용 : ${widget.feedItems[i]['content']}'),
                  Text('날짜 : ${widget.feedItems[i]['date']}')
                ],
              ),
            ),
          ],
        );
      }
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}

class Upload extends StatelessWidget {
  const Upload({super.key, this.userImage, this.setUserContent, this.addMyData});
  final userImage;
  final setUserContent;
  final addMyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            addMyData();
            Navigator.pop(context);
          }, icon: Icon(Icons.send))
        ],
      ),
      body: Column(
        children: [
          Image.file(userImage),
          Text('이미지 업로드 화면'),
          TextField(onChanged: (text) {
            setUserContent(text);
          }),
          IconButton(onPressed: (){ Navigator.pop(context); }, icon: Icon(Icons.close))
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('profile page')),
    );
  }
}


