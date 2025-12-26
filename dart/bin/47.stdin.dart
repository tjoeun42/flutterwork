// stdin : 콘솔에 입력 받기
//        - readLineSync() : 사용자로 부터 입력 받기. String형
// stdout : 콘솔에 출력하기

import 'dart:convert';
import 'dart:io';

void main() {
  // print('이름을 입력하세요 : ');
  stdout.write('이름을 입력하세요 : ');
  String? name = stdin.readLineSync(encoding: utf8);
  print('입력한 이름 : $name');

  stdout.write('학번을 입력하세요(숫자로) : ');
  String? number = stdin.readLineSync();
  int stNum = int.parse(number!);
  print(stNum);

  stdout.write('두 숫자 입력(공백으로 구분) : ');
  String? input = stdin.readLineSync();

  List<String> value = input!.split(' ');
  int inputA = int.parse(value[0]);
  int inputB = int.parse(value[1]);

  print('합계 : ${inputA + inputB}');
}