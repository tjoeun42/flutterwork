class Employee {
  static String? building;
  String name;

  Employee(this.name);

  void printNameAndBuilding() {
    print('제 이름은 $name 입니다. $building 에서 근무하고 있습니다');
  }

  static void printBuilding() {
    print('저는 $building 에서 근무중 입니다');
  }
}

void main() {
  Employee hong = Employee('길동');
  Employee kim = Employee('사랑');

  hong.name = '변경';
  hong.printNameAndBuilding();
  kim.printNameAndBuilding();

  Employee.building = '한국빌딩';
  hong.printNameAndBuilding();
  kim.printNameAndBuilding();

  Employee.printBuilding();
}