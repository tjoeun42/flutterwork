// named constructor : 생성자에 이름을 만들어주기
//                     클래스명.이름작명()
class Idol {
  String name;
  List<String> members;

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
  print(idol1.name);
  print(idol1.members);
  idol1.sayHello();
  idol1.introduce();

  Idol idol2 = Idol.fromList([['정국','뷔','지민','진'], 'BTS']);
  print(idol2.name);
  print(idol2.members);
  idol2.sayHello();
  idol2.introduce();
}