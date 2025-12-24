/*
class Lecture<T> {
  final T id;
  final String name;

  Lecture(this.id, this.name);

  void printIdType() {
    print(id.runtimeType);
  }
}

void main() {
  Lecture<String> lecture1 = Lecture('123', 'javaFullStack');
  lecture1.printIdType();

  Lecture<int> lecture2 = Lecture(123, 'AI');
  lecture2.printIdType();
}
*/
class Lecture<T, S> {
  final T id;
  final S name;

  Lecture(this.id, this.name);

  void printType() {
    print('id type : ${id.runtimeType}');
    print('name type : ${name.runtimeType}');
  }
}

void main() {
  Lecture<String, String> lecture1 = Lecture('123', 'javaFullStack');
  lecture1.printType();

  Lecture<int, String> lecture2 = Lecture(123, 'AI');
  lecture2.printType();
}
