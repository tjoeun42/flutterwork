import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
/*
- where() 사용법
                사용방법                 |    비교방식
------------------------------------------------------------
isEqualTo: value                        | 같다
isGreaterThan: value                    | 크다
isGreaterThanOrEqualTo: value           | 크거나 같다
isLessThan: value                       | 작다
isLessThanOrEqualTo: value              | 작거나 같다
arrayContains: value(List 항목이어야 됨)  | 포함
arrayContainsAny: [...]                 | 배열 중 하나라도 포함
where('field', whereIn: [...])          | 여러 값 중 하나
where('field', whereNotIn: [...])       | 여러 값 제외
 */
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
    // setData();
    // getData();
    // updateData();
    deleteData();
  }

  setData() async {
    var rand = Random();

    // 일괄 쓰기
    WriteBatch batch = firestore.batch();
    var names = [
      '김도환', '이민준', '박서준', '최지우', '정유진',
      '한지민', '오세훈', '강민호', '윤서연', '신동현',
      '조하늘', '백예린', '임수빈', '차은우', '홍지훈',
      '유나린', '서준혁', '문채원', '노태현'
    ];
    var citys = [
      'Seoul', 'Busan', 'Incheon', 'Daegu', 'Gwangju',
      'Daejeon', 'Suwon', 'Sejong', 'Jeju', 'Ulsan',
      'Busan', 'Incheon', 'Sejong', 'Daejeon', 'Suwon',
      'Seoul', 'Busan', 'Jeju', 'Ulsan'
    ];
    var allHobbies = [
      'reading', 'soccer', 'music', 'gaming',
      'traveling', 'cooking', 'drawing', 'hiking'
    ];

    for(var i=0; i<19; i++) {
      DocumentReference id = firestore.collection('person').doc('person${i+2}');

      // 취미는 2~4개
      int hobbyCount = rand.nextInt(3)+2;  // 2~4
      var shuffled = List<String>.from(allHobbies)..shuffle();
      var hobbies = shuffled.take(hobbyCount).toList();

      batch.set(id, {
        'name':names[i],
        'age': i+25,
        'city' : citys[i],
        'hobbies': hobbies
      });
    }
    await batch.commit();
  }

  getData() async {
    var persons = await firestore.collection('person').get();
    try {
      for(var doc in persons.docs) {
        print(doc['name']);
      }
      print('------------------------------------------------');

      // 서울에 사는 사람만 가져오기
      var queryByCity = await firestore.collection('person')
                                        .where('city', isEqualTo: 'Seoul')
                                        .get();
      for(var doc in queryByCity.docs) {
        print('${doc['name']} - ${doc['city']}');
      }
      print('------------------------------------------------');

      // 나이가 30세 이상인 사람만 가져오기
      var queryByage = await firestore.collection('person')
                                      .where('age', isGreaterThanOrEqualTo: 30)
                                      .get();
      for(var doc in queryByage.docs) {
        print('${doc['name']} - ${doc['age']}');
      }
      print('------------------------------------------------');

      // 나이가 30세 이상 35세 이하인 사람
      var ageUntil = await firestore.collection('person')
                                    .where('age', isGreaterThanOrEqualTo: 30)
                                    .where('age', isLessThanOrEqualTo: 35)
                                    .get();
      for(var doc in ageUntil.docs) {
        print('${doc['name']} - ${doc['age']}');
      }
      print('------------------------------------------------');

      // 취미에 hiking이 포함되어 있는 데이터
      var hobbies = await firestore.collection('person')
                                    .where('hobbies', arrayContains: 'hiking')
                                    .get();
      for(var doc in hobbies.docs) {
        print('${doc['name']} - ${doc['hobbies']}');
      }
      print('------------------------------------------------');

      // 취미에 'music', 'drawing' 이중에서 하나라도 포함되어 있으면 가져오기
      var queryByhobbies = await firestore.collection('person')
                                          .where('hobbies', arrayContainsAny: ['music', 'drawing'])
                                          .get();
      for(var doc in queryByhobbies.docs) {
        print('${doc['name']} - ${doc['hobbies']}');
      }
      print('------------------------------------------------');

      // 여러 도시 조건
      var queryByCities = await firestore.collection('person')
                                          .where('city', whereIn: ['Seoul','Gwangju','Daegu'])
                                          .get();
      for(var doc in queryByCities.docs) {
        print('${doc['name']} - ${doc['city']}');
      }
      print('------------------------------------------------');
      
      // 여러 이름 조건
      var queryByNames = await firestore.collection('person')
                                        .where('name', whereIn: ['강민호', '최지우', '서준혁'])
                                        .get();
      for(var doc in queryByNames.docs) {
        print(doc['name']);
      }
      print('------------------------------------------------');

      // 이름의 내림차순 정렬
      var nameSort = await firestore.collection('person')
                                    //.orderBy('name', descending: true)    // 내림차순 정렬
                                    .orderBy('name')  // 오름차순은 안넣어도 됨
                                    .get();
      for(var doc in nameSort.docs) {
        print(doc['name']);
      }
      print('------------------------------------------------');

      // 나이가 30세 이상인 사람을 age순(오름차순)으로 가져오기
      var queryByAgeOrder = await firestore.collection('person')
                                            .where('age', isGreaterThanOrEqualTo: 30)
                                            .orderBy('age')
                                            .get();
      for(var doc in queryByAgeOrder.docs) {
        print('${doc['name']} - ${doc['age']}');
      }
      print('------------------------------------------------');

      // 나이가 30세 이상인 사람을 name순(오름차순)으로 가져오기
      var queryByAgeOrderName = await firestore.collection('person')
                                                .where('age', isGreaterThanOrEqualTo: 30)
                                                .orderBy('name')
                                                .get();
      for(var doc in queryByAgeOrderName.docs) {
        print('${doc['name']} - ${doc['age']}');
      }
    } catch(e) {
      print('서버 오류');
    }
  }
  
  /*
  * set vs update
    - set은 같은 문서이면 update하고, 문서가 없으면 생성
    - update는 반드시 문서가 있어야 한다. 없으면 오류
   */
  updateData() async {
    await firestore.collection('person')
                    .doc('person1')
                    .update({'hobbies':['reading', 'traveling']});
    var hobbyUpdate = await firestore.collection('person')
                                      .doc('person1')
                                      .get();
    print(hobbyUpdate['hobbies']);
    print('------------------------------------------------');

    // 아래와 같이 하면 name, age, city모두 지워지고 hobbies만 덮어쓰기 됨
    await firestore.collection('person')
                    .doc('person1')
                    .set({'hobbies':['cooking', 'gaming']});

    // set을 할때는 모든 필드를 다 넣어줘야 함.
    await firestore.collection('person')
                    .doc('person1')
                    .set({'name':'홍길동',
                          'age':20,
                          'city':'Seoul',
                          'hobbies':['cooking', 'gaming']});
    print('------------------------------------------------');

    // 나이가 35세 이상인 데이터를 age+10 값으로 update
    var queryByAge = await firestore.collection('person')
                                              .where('age', isGreaterThanOrEqualTo: 35)
                                              .get();
    for(var doc in queryByAge.docs) {
      // var data = doc.data();
      // var age = data['age'];
      // print(age);
      // var age2 = doc.data()['age'];
      var age2 = doc['age'];

      await firestore.collection('person').doc(doc.id).update({
        'age' : age2 + 10
      });
    }

    // 결과확인
    var queryByAgeOrder = await firestore.collection('person')
                                          .orderBy('age')
                                          .get();
    for(var doc in queryByAgeOrder.docs) {
      print('${doc['name']} - ${doc['age']}');
    }
  }

  // 삭제
  deleteData() async {
    // await firestore.collection('product')
    //                 .doc('OxBhjLgUPJqWiWdsOPGw')
    //                 .delete();

    // 문서안의 필드만 삭제
    await firestore.collection('product')
                    .doc('uuUTLzXgYjgfKuX40R0W')
                    .update({'price': FieldValue.delete()});
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Shop Page firebase'),
    );
  }
}
