void main() {
  List<String> blackPink = ['로제', '지수', '리사', '제니'];

  Iterable<String> newBlackPink = blackPink.map((x) {
    return '블랙핑크 $x';
  });
  // 화살표 함수로 변경
  // Iterable<String> newBlackPink = blackPink.map((x) => '블랙핑크 $x');

  print(blackPink);
  print(newBlackPink);
  print(newBlackPink.toList());
  print('----------------------------------');

  String number = '13579';
  List<String> jpg = number.split('').map((x) => '$x.jpg').toList();
  print(jpg);
  print('----------------------------------');

  Map<String, String> herryPotter = {
    'Harry Potter' : '해리포터',
    'Ron Weasley' : '론 위즐리',
    'Hermione Granger' : '헤르미온느 그레인저'
  };

  var result = herryPotter.map((key, value) => MapEntry('Harry Potter Character $key', '해리포터 캐릭터 $value'));
  print(herryPotter);
  print(result);
}