/*
immutable : 한번 만들어진 객체(값)를 변경할 수 없다는 개념
            값을 바꿀수 없기 때문에 항상 새로운 객체를 만들어서 교체
  - 왜 사용하는지
    > 상태 추적 쉽다
    > 멀티스레드 환경에서 안전
    > 상태관리가 중요한 flutter에서는 매우 중요
  - 방법
    1. 인스턴스 변수를 상수로 만드는 방법
    2. 생성자를 상수로 만드는 방법
 */

// 방법 1. 인스턴스 변수를 상수로 변경
/*
class Idol {
  final String name;
  final List<String> members;

  Idol(this.name, this.members);

  Idol.fromList(List values)
      : this.members = values[0],
        this.name = values[1];

  void sayHello() {
    print('안녕하세요 $name 입니다');
  }

  void introduce() {
    print('저희 멤버는 $members 입니다');
  }
}

void main() {
  Idol idol1 = Idol('블랙핑크', ['지수', '제니', '리사', '로제']);
  // idol1.name = 'IT';  한번 객체를 생성하면 값 변경 불가
  print(idol1.name);
  print(idol1.members);
  idol1.sayHello();
  idol1.introduce();

  Idol idol2 = Idol.fromList([['정국','뷔','지민','진'], 'BTS']);
  // idol2.members = ['a','b'];
  print(idol2.name);
  print(idol2.members);
  idol2.sayHello();
  idol2.introduce();
}
 */

// 방법 2.
class Idol {
  final String name;
  final List<String> members;

  const Idol(this.name, this.members);

  Idol.fromList(List values)
      : this.members = values[0],
        this.name = values[1];

  void sayHello() {
    print('안녕하세요 $name 입니다');
  }

  void introduce() {
    print('저희 멤버는 $members 입니다');
  }
}

void main() {
  Idol idol1 = const Idol('블랙핑크', ['지수', '제니', '리사', '로제']);
  // idol1.name = 'IT';  // 한번 객체를 생성하면 값 변경 불가
  print(idol1.name);
  print(idol1.members);
  idol1.sayHello();
  idol1.introduce();

  Idol idol2 = Idol.fromList([['정국','뷔','지민','진'], 'BTS']);
  // idol2.members = ['a','b'];
  print(idol2.name);
  print(idol2.members);
  idol2.sayHello();
  idol2.introduce();
}