import 'dart:convert';

import 'package:http/http.dart' as http;

class DbService {
  final String baseUrl = "http://172.16.250.4:8080";    // Springboot api 주소

  Future<bool> emailCheck(String email) async {
    final response = await http.get(Uri.parse("$baseUrl/flutter/email-check?email=$email"));
    if(response.statusCode == 200) {
      return jsonDecode(response.body)['isAvaliable'];
    }
    throw Exception("이메일 확인 실패");
  }
}