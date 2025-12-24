/*
* getter / setter
  변수처럼 사용(java에서는 함수로 만듬)
  - 단순히 값을 넣거나 가져올 때 사용
  - 함수를 사용하는 이유는 그 안에 어떤 로직을 구현할 때 사용
 */
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

  // getter
  String get firstMember {
    return members[0];
  }

  // setter : 파라미터는 무조건 1개만 받을 수 있다
  set firstMember(String name) {
    this.members[0] = name;
  }

  // final이 붙어서 아예 변경 불가
  /*
  set nameSet(String name) {
    this.name = name;
  }
  */
}

void main() {
  Idol idol1 = Idol('블랙핑크', ['지수', '제니', '리사', '로제']);
  Idol idol2 = Idol.fromList([['정국','뷔','지민','진'], 'BTS']);
  print(idol1.firstMember);
  print(idol2.firstMember);

  print('-----------------------');

  // idol1.firstMember('나나');  오류
  idol1.firstMember = '나나';
  idol2.firstMember = '슈가';
  print(idol1.firstMember);
  print(idol2.firstMember);
}