/*
* 생성자
  - default constructors : 생성자를 선언하지 않을 때 제공되는 생성자
  - named constrctors : 개발자의 필요에 의해 생성한 생성자
  - redirection constrctors : 생성자의 본문은 비어있지만 전달 된 생성자에 대한 초기값 등을 구현할 때 사용
  - const constrctors : 상수 생성자, 클래스가 불변의 객체를 생성하는 경우 사용
  - factory constrctors : 매번 새로운 객체를 만들지 않고, 이미 존재하는 객체를 반환
*/
class Idol {
  String name;
  List<String> members;
  /*
  Idol(String name, List<String> members)
    : this.name = name,
      this.members = members;
  */
  // 위의 생성자를 간단히 하면
  Idol(this.name, this.members);

  sayHello() {
    print('안녕하세요 $name 입니다');
  }

  introduce() {
    print('저의 멤버는 $members 입니다');
  }
}

void main() {
  Idol blackPink = Idol('블랙핑크', ['지수', '제니', '리사', '로제']);

  print(blackPink.name);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.introduce();
}