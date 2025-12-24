class TimesTwo {
  final int num;
  TimesTwo(this.num);

  int calculate() => num * 2;
}
class TimeFour extends TimesTwo {
  // TimeFour(int num) : super(num);
  TimeFour(super.num);

  @override
  int calculate() {
    // 1. 부모의 num값 호출
    // return super.num * 4;
    // return this.num * 4;  // 나의 클래스에도 num이 있기 때문에 사용 가능

    // 2. 부모의 메소드를 불러와서 사용
    return super.calculate() * 2;
  }
}

void main() {
  TimesTwo tt = TimesTwo(2);
  print(tt.calculate());

  TimeFour tf = TimeFour(2);
  print(tf.calculate());
}