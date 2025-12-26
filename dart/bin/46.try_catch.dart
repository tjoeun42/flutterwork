/*
* 예외 처리
  - finally : 코드에 return문이 있어도 됨
  - on : 오류의 종류를 알 때 그 오류의 이름을 예외처리
  - throw / rethrow : 일부러 오류를 발생시킬 때
 */

/*
void main() {
  int num = 10;
  print(num / 0); // 오류가 안나고 Infinity로 나옴
  try {
    print(num ~/ 0);
  } catch(error, stack) {
    print('오류 메시지 : $error');
    print('stack에 들어있는 오류 전체 : $stack');
  } finally {
    print('finally 구문');
  }
  print('main 끝');
}
 */

/*
// on : 오류의 종류를 알 때 그 오류의 이름을 예외처리
void main() {
  int num = 10;
  try {
    print(num ~/ 0);
  } on UnsupportedError catch(e) {
    print('~/ 해당 연산자는 0으로 나눌 수 없다');
  } on TypeError catch(e) {
    print('타입이 맞지 않음');
  } catch(e) {
    print('오류발생 : $e');
  }
}
 */

void main() {
  try {
    tjoeun();
  } catch(e) {
    print('error : $e');
  }
}

void tjoeun() {
  try {
    // throw Exception('오류 발생 시킴!!');
    throw CustomException('customException을 발생 시킴');
  } catch(e) {
    rethrow;
  }
}

// 사용자 정의 예외 클래스
class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() {
    return message;
  }
}

