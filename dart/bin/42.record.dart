// Record : List와 동일하지만 타입을 명시할 수 있다
/*
// 일반 함수
void main() {
  final result = nameAndAge({'name':'더조은', 'age': 20});
  print(result);
}

nameAndAge(Map<String, dynamic> json) {
  return [json['name'], json['age']];
}
 */

// Record
void main() {
  // 1. 출력
  final result = nameAndAge({'name':'더조은', 'age': 20});
  print(result);

  print(result.$1); // $? 각 필드에 명명된 getter호출
  print(result.$2);

  print('-------------------------------');

  // 2. 출력(가장 많이 씀)
  final result1 = getNewJeansWithType();
  for(final item in result1) {
    print(item.$1);
    print(item.$2);
  }

  print('-------------------------------');

  // 3. 출력
  final result2 = getNewJeansWithType2();
  for(final item in result2) {
    print(item.$1);
    print(item.$2);
  }

  print('-------------------------------');

  // 4. 출력
  final result3 = getNewJeansWithType3();
  for(final item in result3) {
    print(item.name);
    print(item.age);
  }

  print('-------------------------------');

  // 5. 출력
  final result4 = getGirlGroup();
  print(result4);
  print(result4.$1);
  print(result4.$2);
  print(result4.$3);
}

// 1.
(String, int)nameAndAge(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}

List<Map<String, dynamic>> getNewJeans() {
  return [
    {'name':'민지', 'age': 20},
    {'name':'혜린', 'age': 19}
  ];
}

// 2.
// 위를 소괄호를 변경
List<(String, int)> getNewJeansWithType() {
  return [('민지', 20), ('혜린',19)];
}

//3.
// 매개변수에 이름을 넣을 수 있음
List<(String name, int age)> getNewJeansWithType2() {
  return [('민지', 20), ('혜린',19)];
}

//4.
List<({String name, int age})> getNewJeansWithType3() {
  return [(name : '민지', age: 20), (name:'혜린',age:19)];
}

// 5.
// record는 매개변수의 갯수 무한
(String name, String group, int age) getGirlGroup() {
  return('민지','뉴진스',23);
}