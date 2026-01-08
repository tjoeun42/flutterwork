import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
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
  final GlobalKey<FormState> infoFormKey = GlobalKey<FormState>();

  int _currentStep = 0;   // step의 번호
  Map<String, dynamic> userInputData = {};

  final Map<String, TextEditingController> controllers = {
    'email' : TextEditingController(),
    'password' : TextEditingController(),
    'passwordConfirm' : TextEditingController(),
    'name' : TextEditingController(),
    'birth' : TextEditingController(),
  };

  Map<String, bool> validation = {'email' : true};
  Future<bool> emailValidCheck() async {
    bool isAvailable = await dbService.emailCheck(controllers['email']!.text);
    setState(() {
      validation['email'] = isAvailable;
    });
    return emailFormKey.currentState!.validate();
  }

  bool passwordValidCheck() {
    return passwordFormKey.currentState!.validate();
  }

  bool passwordValidDoubleCheck() {
    return controllers['password']!.text == controllers['passwordConfirm']!.text;
  }

  bool nameValidCheck() => controllers['name']!.text.isNotEmpty;
  bool birthValidCheck() => controllers['birth']!.text.isNotEmpty;
  bool genderValidCheck() => userInputData['gender'] != null;

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
            if(!EmailValidator.validate(value)) {
              return '유효한 이메일을 입력해 주세요';
            } else if(!validation['email']!) {
              return '이미 등록된 이메일 입니다';
            }
            return null;
          },
        )
      )
    ),
    Step(
      title: Text('Password'),
      content: Form(
        key: passwordFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controllers['password'],
              obscureText: true,
              decoration: InputDecoration(hintText: "비밀번호 입력"),
              validator: (value) => value == null || value.length < 6
                                                      ? "6자리 이상 입력하세요"
                                                      : null,
            ),
            TextFormField(
              controller: controllers['passwordConfirm'],
              obscureText: true,
              decoration: InputDecoration(hintText: "비밀번호 확인"),
              validator: (value) => value != controllers['password']!.text
                                      ? "비밀번호가 일치하지 않습니다"
                                      : null,
            )
          ],
        )
      )
    ),
    Step(
      title: Text("개인 정보"),
      content: Form(
        key: infoFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controllers['name'],
              decoration: InputDecoration(hintText: "이름 입력"),
            ),
            TextFormField(
              controller: controllers['birth'],
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(hintText: "생년월일(YYYY-MM-DD)"),
            ),
            DropdownButtonFormField(
              value: userInputData['gender'],
              items: ["남", "여"].map((g) => DropdownMenuItem(value: g, child: Text(g)))
                                .toList(),
              onChanged: (value) => setState(() {
                userInputData['gender'] = value;
              }),
              hint : Text("성별 선택")
            )
          ],
        )
      )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('회원가입')),
      body: Stepper(
        steps: stepList,
        currentStep: _currentStep,
        onStepContinue: () {
          switch (_currentStep) {
            case 0:
              emailValidCheck().then((value) {
                if(value) {
                  setState(() {
                    _currentStep++;
                  });
                }
              });
              break;
            case 1:
              if(passwordValidCheck() && passwordValidDoubleCheck()) {
                userInputData['password'] = controllers['password']!.text;
                setState(() {
                  _currentStep++;
                });
              }
              break;
            case 2:
              if(nameValidCheck() && birthValidCheck() && genderValidCheck()) {
                userInputData['name'] = controllers['name']!.text;
                userInputData['birth'] = controllers['birth']!.text;
                dbService.registerUser(User(
                  email : userInputData['email'],
                  password : userInputData['password'],
                  name : userInputData['name'],
                  birth : userInputData['birth'],
                  gender : userInputData['gender'],
                )).then((_) => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => InitPage())
                  )
                });
              }
          }
        },
        onStepCancel: () {
          if(_currentStep > 0) setState(() {
            _currentStep--;
          });
        },
      ),
    );
  }
}

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final DBService _dbService = DBService();
  List<User> _allUsers = [];
  bool _isLoading = false;
  String _errorMsg = '';

  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
      _errorMsg = '';
    });
    try {
      final users = await _dbService.getAllUsers();
       setState(() {
         _allUsers = users;
       });
    } catch(e) {
      setState(() {
        _errorMsg = "데이터를 가져오는데 실패했습니다.";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _fetchUsers,
        label: Text('모든 회원 정보 가져오기'),
        icon: Icon(Icons.get_app),
      ),
      appBar: AppBar(title: Text('회원가입 완료')),
      body: Column(
        children: [
          Text('축하합니다.\n회원가입이 되었습니다.'),
          if(_isLoading)
            Center(child: CircularProgressIndicator())
          else if (_errorMsg.isNotEmpty)
            Center(
              child: Text(
                  _errorMsg,
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )
          else if (_allUsers.isEmpty)
            Center(
              child: Text(
                "회원정보가 없습니다",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey)
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: _allUsers.length,
                itemBuilder: (context, index) {
                  final user = _allUsers[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('이메일 : ${user.email}', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('이름 : ${user.name}'),
                          Text('생년월일 : ${user.birth}'),
                          Text('성별 : ${user.gender}'),
                        ],
                      ),
                    ),
                  );
                }
              )
            )
        ],
      ),
    );
  }
}

