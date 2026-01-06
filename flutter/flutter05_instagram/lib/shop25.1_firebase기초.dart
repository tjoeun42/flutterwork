import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  void initState() {
    super.initState();
    getData();
    // setData();
  }

  // firebase에서 가져오기
  /*
  getData() async {
    var result = await firestore.collection('product')
                                .doc('aI6Su506WdLXaBwbHNZF')
                                .get();
    print('결과 : $result');
    print('가격 : ${result['price']}');

    // 컬렉션에 있는 모든 데이터 가져오기
    var result2 = await firestore.collection('product').get();
    // for(var doc in result2.docs) {
    //   print(doc['name']);
    // }

    // 서버가 안되거나 하는경우 대비
    if(result2.docs.isNotEmpty) {
      for(var doc in result2.docs) {
        print(doc['name']);
      }
    }
  }
  */

  /*
  // try 예외
  getData() async {
    try {
      var result2 = await firestore.collection('product').get();
      for(var doc in result2.docs) {
        print(doc['name']);
      }
    } catch(e) {
      print('서버 오류');
    }
  }
*/

  getData() async {
    try {
      var result3 = await firestore.collection('product')
                                    .where('price', isGreaterThan: 23000)
                                    .get();
      for(var pro1 in result3.docs) {
        print(pro1['name']);
        print(pro1['price']);
      }
    } catch(e) {
      print('서버 오류');
    }
  }



  // firebase에 저장
  setData() async {
    await firestore.collection('product')
                    .add({'name':'블라우스', 'price':30000});
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Shop Page firebase'),
    );
  }
}
