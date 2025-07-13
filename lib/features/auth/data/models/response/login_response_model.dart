// data/models/response/login_response_model.dart

class LoginResponseModel {
  final String token;
  final String nama;
  final String email;
  final String role;

  LoginResponseModel({
    required this.token,
    required this.nama,
    required this.email,
    required this.role,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
      nama: json['user']['nama'],
      email: json['user']['email'],
      role: json['user']['role'],
    );
  }
}
