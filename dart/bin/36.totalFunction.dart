class Person {
  final String name;
  final String group;

  Person({required this.name, required this.group});

  @override
  String toString() {
    return 'Person(name:$name, group:$group)';
  }
}
void main() {
  List<Map<String, String>> people = [
    {'name' : '로제', 'group' : '블랙핑크'},
    {'name' : '지수', 'group' : '블랙핑크'},
    {'name' : '정국', 'group' : 'BTS'},
    {'name' : '뷔', 'group' : 'BTS'}
  ];
  print(people);
  print('----------------------------------');

  var personPelple = people.map((x) => Person(name: x['name']!, group: x['group']!));
  print(personPelple);

  var result = people
      .map((x) => Person(name: x['name']!, group: x['group']!))
      .where((x) => x.group == 'BTS');
  print(result);

  print('==========================================');

  var result2 = people
      .map((x) => Person(name: x['name']!, group: x['group']!))
      .where((x) => x.group == 'BTS')
      .fold<int>(0, (prev, next) => prev + next.name.length);
  print(result2);
}