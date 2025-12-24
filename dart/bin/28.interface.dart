abstract class IdolInterface {
  String name;
  IdolInterface(this.name);
  void sayName();
}

class BoyGroup implements IdolInterface {
  @override
  String name;

  BoyGroup(this.name);

  @override
  void sayName() {
    print('제 이름은 $name 입니다');
  }
}

class GirlGroup implements IdolInterface {
  @override
  String name;

  GirlGroup(this.name);

  @override
  void sayName() {
    print('제 이름은 $name 입니다');
  }
}

void main() {
  BoyGroup bts = BoyGroup('BTS');
  GirlGroup redVelet = GirlGroup('레드벨벳');

  bts.sayName();
  redVelet.sayName();

  print(bts is IdolInterface);
  print(bts is BoyGroup);
  print(bts is GirlGroup);
}