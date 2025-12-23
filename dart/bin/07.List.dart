/*
* 집합 자료형 : List, Set, Map
  - List type
    java의 List와 동일
 */

void main() {
  List<String> name = ['홍길동', '제니', '이한나'];
  List<int> numbers = [1,2,3,4,5];
  print(name);
  print(numbers);

  print(name[1]);
  print(name.length);

  name.add('최인영');
  print(name);

  name.remove('최인영');
  print(name);

  print(name.indexOf('제니'));
}