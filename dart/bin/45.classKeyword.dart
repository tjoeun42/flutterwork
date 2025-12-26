// 클래스 앞에 붙는 keyword

/*
// 1. final
//    extends, implement, mixin으로 사용불가
final class Person {
  final String name;
  final int age;

  Person({
    required this.name,
    required this.age
  });
}

class Student extends Person {
  Student({required super.name, required super.age});
}
*/

// 2. base
//    extends는 가능하지만 같은 라이브러리 안에서만
//    implement, mixin 불가
base class Person2 {
  final String name;
  final int age;

  Person2({
    required this.name,
    required this.age
  });
}

base class Student extends Person2 {
  Student({required super.name, required super.age});
}

// 3. sealed
//    abstract(객체생성 못함)이면서 final임.
//    같은 라이브러리에서만 상속 가능
//    패터매칭을 사용할 수 있음.
sealed class Person3 {}
class Idol extends Person3 {}
class Chef extends Person3 {}
class Tjoeun extends Person3 {}

String whoIsHe(Person3 person) => switch(person) {
  Idol i => '아이돌',
  Chef c => '쉐프',
  _ => '나머지'
};

void main() {
  print(whoIsHe(Idol()));
  print(whoIsHe(Chef()));
  print(whoIsHe(Tjoeun()));
}

// 4. mixin
//    dart에서는 다중 상속 안됨
//    mixin에서는 with키워드로 다중 상속을 가능하게 한다.
//    생성자 없음
mixin class AnimalMixin {
  String bark() {
    return '멍멍';
  }
}

mixin class AnimalMixin2 {
  String bark() {
    return '23';
  }
}

mixin class AnimalMixin3 {
  String bark() {
    return '67';
  }
}

// class Dog extends AnimalMixin, AnimalMixin2 { }
class Dog with AnimalMixin, AnimalMixin2 { }
class Cat extends AnimalMixin with AnimalMixin2, AnimalMixin3 {}


/*
정리

키워드           | extends  | implements | with | 외부 상속
class           |    o     |      o     |  o   |    o
final class     |    x     |      x     |  x   |    x
base class      |    o     |      x     |  x   |    x
interface class |    x     |      o     |  x   |    o
sealed class    |    o     |      x     |  x   |    x
abstract class  |    o     |      o     |  o   |    o
mixin class     |    o     |      o     |  o   |    o
*/