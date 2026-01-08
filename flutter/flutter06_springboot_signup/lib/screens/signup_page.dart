import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../services/db_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final DBService dbService = DBService();

  // GlobalKey<FormState> : 폼의 유효성 검사를 하는 메소드
  // TextFormField의 validator 함수들을 실행하고, 모든 유효성 검사를 통과하면 true 반환
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  int _currentStep = 0;   // step의 번호
  Map<String, dynamic> userInputData = {};

  final Map<String, TextEditingController> controllers = {
    'email' : TextEditingController(),
    'password' : TextEditingController(),
    'name' : TextEditingController(),
    'birth' : TextEditingController(),
    'gender' : TextEditingController()
  };

  Map<String, bool> validation = {'email' : true};

  List<Step> get stepList => [
    Step(
      title: Text('Email'),
      content: Form(
        key: emailFormKey,
        child: TextFormField(
          controller: controllers['email'],
          decoration: InputDecoration(hintText: '이메일을 입력하세요'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => userInputData['email'] = value,
          validator: (value) {
            if(value == null || value.isEmpty) {
              return '이메일은 반드시 입력해야 합니다';
            }
            if(EmailValidator.validate(value)) {
              return '유효한 이메일을 입력해 주세요';
            }
          },
        )
      )
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
