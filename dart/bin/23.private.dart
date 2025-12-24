/*
* private : _(언더스코어)를 붙이면 private임.
  - class에 _(언더스코어)를 붙이면 현재 파일에서만 사용가능. 다른곳에서 import못함
  - 변수나 함수 앞에 붙여도 동일
 */
class _Idol {
  final String _name;
  final List<String> _members;

  _Idol(this._name, this._members);

  _Idol.fromList(List values)
    : this._members = values[0],
      this._name = values[1];

  _sayHello() {
    print('안녕하세요 $_name 입니다');
  }

  introduce() {
    print('저희 멤버는 $_members 입니다');
  }

  String get firstMember {
    return _members[0];
  }

  String get name => _name;

  set firstMember(String name) {
    this._members[0] = name;
  }

}

void main() {
  _Idol idol1 = _Idol('블랙핑크', ['지수', '제니', '리사', '로제']);
  _Idol idol2 = _Idol.fromList([['정국','뷔','지민','진'], 'BTS']);

  idol1._sayHello();
  print(idol1.firstMember);
  print(idol2.firstMember);

  print('-----------------------');

  idol1.firstMember = '나나';
  idol2.firstMember = '슈가';
  print(idol1.firstMember);
  print(idol2.firstMember);
}