// where 함수 : 결과가 true인 것만 가져오기(filter와 동일)
void main() {
  List<Map<String, String>> people = [
    {'name' : '로제', 'group' : '블랙핑크'},
    {'name' : '지수', 'group' : '블랙핑크'},
    {'name' : '정국', 'group' : 'BTS'},
    {'name' : '뷔', 'group' : 'BTS'}
  ];
  print(people);
  
  // group가 블랙핑크만 가져오기
  var blackPink = people.where((x) => x['group'] == '블랙핑크');
  print(blackPink);

  var bts = people.where((x) => x['group'] == 'BTS');
  print(bts);
}