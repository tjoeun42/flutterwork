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
  String get FirstMember {
    return members[0];
  }
}