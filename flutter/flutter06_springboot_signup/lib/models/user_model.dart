class User {
  final String email;
  final String password;
  final String name;
  final String birth;
  final String gender;

  User({
    required this.email,
    required this.password,
    required this.name,
    required this.birth,
    required this.gender
  });

  // 서버로 보낼때 사용
  Map<String, dynamic> toJson() {
    return {
      'email' : email,
      'password' : password,
      'name' : name,
      'birth' : birth,
      'gender' : gender
    };
  }

  // 서버에 정보를 받아왔을 때
  factory User.fromJson(Map<String, dynamic> json) {
    return User (
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      birth: json['birth'] as String,
      gender: json['gender'] as String,
    );
  }
}