void main() {
  List<int> numbers = [1,3,5,7,9];

  var result = numbers.reduce((prev, next) {
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');
    print('----------------------------');
    return prev + next;
  });
  print('결과 : $result');

  List<String> words = ['안녕', '더조은', '학원'];
  var sentence = words.reduce((prev, next) => prev + next);
  print(sentence);

  // 타입이 맞아야 한다. 들어오는 값은 String인데 결과는 int형이면 오류
  // var count = words.reduce((prev, next) => prev.length + next.length);
}