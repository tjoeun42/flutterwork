// optional parameter : 있어도 되고 없어도 되는 파라미터. 대괄호를 묶는다
void main() {
  addNumbers(20);
  addNumbers(20, 15);
}

// addNumbers(int x, [int y, int z]) // 오류. non-nullable타입이기 때문(값을 안넣으면 null이 들어갈 수 있기 때문)
addNumbers(int x, [int? y, int? z]) {

}