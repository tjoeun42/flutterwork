import 'package:flutter/material.dart';
import 'screens/signup_page.dart';

/*
  1. Step기반 회원가입 폼 구성
  2. 각 단계의 유효성 검사(validator)
  3. 비동기 이메일 중복 검사
  4. 모든 데이터 취합하여 spring boot로 전송
  5. 회원가입 완료시 완료 페이지로 이동

  폴더구성
  lib/
    |--- main.dart
    |--- screens /
    |     |-- signup_page.dart
    |--- services /
    |     |-- db_service.dart
    |--- models /
    |     |-- user_model.dart

    * SafeArea :
      각각의 핸드폰 제조사마다 버튼등의 위치가 제각각이라 기종에 따라 내용이
      가려지거나 사라지는 UI가 생기게됨.
      직접 마진, 패딩을 줘야됨.
      하지만 SafeArea를 사용하면 충분한 패딩을 알아서 줌

    * stepper : 단계별 진행 상황을 표시
      - steps : 화면에 보여줄 Step 리스트
      - type : 수직으로 보여줄 것인지, 수평으로 보여줄 것인지
      - elevation : type이 수평으로 설정되어 있을 때만 사용가능, 상단의 표시되는 스템들의 높이 지정
      - currentStep : 현재 표시되는 스템의 index값
      - onStepTapped : 스텝들을 탭 했을 때 동작할 로직 구현
      - onStepContinue : 다음 버튼을 탭 했을 때 동작할 로직 구현
      - onStepCancel : 취소 버튼을 탭 했을 때 동작할 로직 구현
 */
void main() {
  runApp(MaterialApp(
    home: SignUpPage(),
  ));
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Stepper Sample')),
        body: const Center(child: StepperExample()),
      ),
    );
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Step 1 title'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1'),
          ),
        ),
        const Step(title: Text('Step 2 title'), content: Text('Content for Step 2')),
      ],
    );
  }
}
*/