class UserModel {
  final String token;
  final String name;
  final String email;
  final String phone;

  UserModel({
    required this.token,
    required this.name,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      token: map['token'].toString(),
      name: map['name'].toString(),
      email: map['email'].toString(),
      phone: map['phone'].toString(),
    );
  }
}
