/*
* fold 함수 : reduce() 함수와 동일.
  - 다른 점
    > 초기값을 줄 수 있다
    > 결과 타입이 안맞아도 됨
 */
void main() {
  List<int> numbers = [1,3,5,7,9];

  var result = numbers.fold(10, (prev, next) {
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');
    print('----------------------------');
    return prev + next;
  });

  List<String> words = ['안녕', '더조은', '학원'];
  var sentence = words.fold<String>('', (prev, next) => prev + next);
  print(sentence);

  var count = words.fold<int>(0, (prev, next) => prev + next.length);
  print(count);
}