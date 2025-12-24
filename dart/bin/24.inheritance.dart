class Idol {
  String name;
  int membersCount;

  Idol({required this.name, required this.membersCount});


  sayName() {
    print('저는 $name 입니다.');
  }

  sayMembersCount() {
    print('$name은 $membersCount명의 멤버로 구성되어 있습니다');
  }
}

class BoyGroup extends Idol {
  // 1.
  /*
  BoyGroup(String name, int membersCount)
    : super(membersCount: membersCount, name: name);
  */

  // 2.
  BoyGroup({required super.membersCount, required super.name});
}
void main() {
  Idol idol1 = Idol(name: '블랙핑크', membersCount: 5);
  idol1.sayName();
  idol1.sayMembersCount();
  print('-------------------------------');
  // 1. 생성자 사용시
  // BoyGroup bts = BoyGroup('BTS', 7);

  // 2. 생성자 사용시
  BoyGroup bts = BoyGroup(name: 'BTS', membersCount: 7);
  bts.sayName();
  bts.sayMembersCount();
}