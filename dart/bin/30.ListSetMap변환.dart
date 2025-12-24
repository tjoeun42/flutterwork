void main() {
  List<String> blackPaink = ['로제', '지수', '리사', '제니', '지수'];
  print(blackPaink);
  print(blackPaink.asMap());
  print(blackPaink.toSet());

  // List -> Map
  Map blackPinkMap = blackPaink.asMap();
  print(blackPinkMap.keys);
  print(blackPinkMap.values);

  // Map -> List
  print(blackPinkMap.keys.toList());
  print(blackPinkMap.values.toList());

  // List -> set
  Set blackPinkSet = blackPaink.toSet();
  print(blackPinkSet);

  // 함수 사용
  blackPinkSet = Set.from(blackPaink);
  print(blackPinkSet);

  // set -> List
  print(blackPinkSet.toList());
}