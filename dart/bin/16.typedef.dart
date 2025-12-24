/*
* typedef : 함수의 타입을 정의하기 위해 사용
  - 사용하는 이유
    1. 함수의 타입이 길어질 때 가독성 향상
    2. 같은 형태의 함수를 여러 곳에서 재사용하기 위해
    3. API나 콜백의 의도를 분명하게 표현

  - 사용법
    typedef 타입이름 = 반환타입 Function(매개변수들);
 */

/*
typedef Operation = int Function(int x, int y, int z);

int add(int x, int y, int z) => x + y + z;
int subtract(int x, int y, int z) => x - y - z;

void main() {
  Operation operation = add;
  int result = operation(10, 20, 30);
  print(result);

  operation = subtract;
  result = operation(10, 20, 30);
  print(result);
}
*/

typedef Operation = int Function(int x, int y, int z);

int add(int x, int y, int z) => x + y + z;
int subtract(int x, int y, int z) => x - y - z;
int multi(int x, int y, int z) => x * y * z;

int claculate(int x, int y, int z, Operation operation) {
  return operation(x, y, z);
}

void main() {
  int result = claculate(10, 20, 30, multi);
  print(result);
}