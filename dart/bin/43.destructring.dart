// Destructring(구조 분해) : 어떤 구조이든 각각의 변수에 한번에 대입
void main() {
  // tuple
  final (name, age) = ('민지', 20);
  print(name);
  print(age);
  print('-----------------------------');

  // List
  final newJeans = ['민지', '혜린'];
  final [String name1, String name2] = newJeans;
  print(name1);
  print(name2);
  print('-----------------------------');

  // rest 연산자
  final numbers = [1,2,3,4,5,6,7,8,9];
  final [x, y, ..., z] = numbers;
  print(x);
  print(y);
  print(z);
  print('-----------------------------');

  final [x1, y1, ...rest1, z1] = numbers;
  print(x1);
  print(y1);
  print(z1);
  print(rest1);
  print('-----------------------------');

  // _ 는 건너뛰기
  final [x2, _, y2, ...rest2, z2, _] = numbers;
  print(x2);
  print(y2);
  print(z2);
  print(rest2);
  print('-----------------------------');

  // Map
  final minJiMap = {'name':'민지', 'age':20};
  final {'name': name3, 'age' : age3} = minJiMap;
  print(name3);
  print(age3);
  print('-----------------------------');

  final minJiIdol = Idol(name: '민지', age: 24);
  final Idol(name: name4, age: age4) = minJiIdol;
  print(name4);
  print(age4);
}

class Idol {
  final String name;
  final int age;

  Idol({
      required this.name,
      required this.age
  });
}