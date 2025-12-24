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
  BoyGroup(String name, int membersCount)
      : super(membersCount: membersCount, name: name);

  void sayMale() {
    print('저희는 남자 아이돌 입니다');
  }
}

class GirlGroup extends Idol {
  GirlGroup(String name, int membersCount)
      : super(membersCount: membersCount, name: name);

  void sayFemale() {
    print('저희는 여자 아이돌 입니다');
  }
}

void main() {
  Idol idol1 = Idol(name: '블랙핑크', membersCount: 5);
  idol1.sayName();
  idol1.sayMembersCount();
  // idol1.sayMale();

  print('------------------------');

  BoyGroup bts = BoyGroup('BTS', 7);
  bts.sayName();
  bts.sayMembersCount();
  bts.sayMale();

  print('------------------------');

  GirlGroup apink = GirlGroup('에이핑크', 5);
  apink.sayName();
  apink.sayMembersCount();
  apink.sayFemale();

  print('---------- Type Comparison -----------');
  print(apink is Idol);
  print(apink is GirlGroup);
  print(apink is BoyGroup);
}