import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  print('가위, 바위, 보 중에서 선택 : ');
  String? userInput = stdin.readLineSync(encoding: utf8);

  const selectList = ['가위', '바위', '보'];
  final comInput = selectList[Random().nextInt(3)];

  final result = getResult(userInput!, comInput);
  print('사용자는 $userInput을 냈습니다');
  print('컴퓨터는 $comInput을 냈습니다');
  print('결과 : $result');
}
String getResult(String userInput, String comInput) {
  const comWin = '컴퓨터가 승리 하였습니다';
  const userWin = '사용자가 승리 하였습니다';
  const draw = '비겼습니다';
  String result = draw;

  switch(userInput) {
    case '가위' :
      if(comInput == '바위') {
        result = comWin;
      }
      if(comInput == '보') {
        result = userWin;
      }
    case '바위' :
      if(comInput == '가위') {
        result = userWin;
      }
      if(comInput == '보') {
        result = comWin;
      }
    case '보' :
      if(comInput == '바위') {
        result = userWin;
      }
      if(comInput == '가위') {
        result = comWin;
      }
    default:
      result = '올바른 값을 넣어주세요';
  }
  return result;
}