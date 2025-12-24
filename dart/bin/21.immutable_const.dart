/*
객체 선언시 const가 없을 때 : 객체가 별도로 만들어짐. 서로 다른 객체
객체 선언시 const가 있을 때 : 하나의 객체로 사용. 같은 객체
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
}

void main() {
  Idol idol1 = Idol('블랙핑크', ['지수', '제니', '리사', '로제']);
  Idol idol2 = Idol('블랙핑크', ['지수', '제니', '리사', '로제']);
  print(idol1 == idol2);

  Idol idol3 = const Idol('블랙핑크', ['지수', '제니', '리사', '로제']);
  Idol idol4 = const Idol('블랙핑크', ['지수', '제니', '리사', '로제']);
  Idol idol5 = const Idol('BTS', ['정국','뷔','지민','진']);
  print(idol3 == idol4);
  print(idol3 == idol5);
}