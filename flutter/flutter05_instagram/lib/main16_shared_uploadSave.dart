import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // shared에 저장
  saveData() async {
    var storage = await SharedPreferences.getInstance();
    List<String> stringList = feedItems.map((item) => jsonEncode(item)).toList();
    await storage.setStringList('items', stringList);
  }

  // shared에서 가져오기
  loadData() async {
    var storage = await SharedPreferences.getInstance();
    List<String>? stringList = storage.getStringList('items');

    if(stringList != null) {
      List<Map<String, dynamic>> restored =
          stringList.map((item)=> jsonDecode(item) as Map<String, dynamic>).toList();

      setState(() {
        feedItems = restored;
      });
    } else {
      getData();
    }
  }

  setUserContent(newContent) {
    setState(() {
      userContent = newContent;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
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
    // var now = DateTime.now();
    // var formatter = DateFormat('MMM dd');
    String formattedData = DateFormat('MMM dd').format(DateTime.now());
    var myData = {
      "id": feedItems.length,
      "image": userImage is String ? userImage : userImage.path,
      "likes": 0,
      "date": formattedData,
      "content": userContent,
      "liked": false,
      "user": "John Kim"
    };
    setState(() {
      feedItems.insert(0, myData);
    });
    saveData();
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
            widget.feedItems[i]['image'].runtimeType == String && (widget.feedItems[i]['image'] as String).startsWith('http')
            ? Image.network(widget.feedItems[i]['image'])
            : Image.file(File(widget.feedItems[i]['image']), height: 250, width: double.infinity, fit: BoxFit.cover),

            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('좋아요 : ${widget.feedItems[i]['likes']}'),
                  Text('글쓴이 : ${widget.feedItems[i]['user']}'),
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


