import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class DBService {
  final String baseUrl = "http://172.16.250.4:8080";    // Springboot api 주소

  Future<bool> emailCheck(String email) async {
    final response = await http.get(Uri.parse("$baseUrl/flutter/email-check?email=$email"));
    if(response.statusCode == 200) {
      // 서버에서 Map<"isAvaliable", false> 이런식을 보낼예정
      return jsonDecode(response.body)['isAvaliable'];
    }
    throw Exception("이메일 확인 실패");
  }

  Future<void> registerUser(User user) async {
    final response = await http.post(
      Uri.parse("$baseUrl/flutter/insert"),
      headers: {'Content-Type' : 'application/json'},
      body: jsonEncode(user.toJson())
    );
    if(response.statusCode != 200) {
      throw Exception("회원가입 실패");
    }

    Future<List<User>> getAllUsers() async {
      final response = await http.get(Uri.parse("$baseUrl/flutter/users"));
      if(response.statusCode == 200) {
        List<dynamic> userList = jsonDecode(response.body);
        return userList.map((u) => User.fromJson(u)).toList();
      } else {
        throw Exception("모든 사용자정보 가져오기 실패 : ${response.statusCode}");
      }
    }
  }

  Future<dynamic> getAllUsers() async {}
}


