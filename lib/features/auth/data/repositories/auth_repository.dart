// data/repository/auth_repository.dart

import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:travelkita/features/auth/data/models/request/login_request_model.dart';
import 'package:travelkita/features/auth/data/models/response/login_response_model.dart';
import 'package:travelkita/service/service_htp_client.dart';

class AuthRepository {
  final _http = ServiceHttpClient();

Future<Either<String, LoginResponseModel>> login(LoginRequestModel request) async {
  try {
    final response = await _http.post('auth/login', request.toJson());

log('Response login: ${response.body}');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final loginResponse = LoginResponseModel.fromJson(json);
      return Right(loginResponse);
    } else {
      // bisa parsing error message dari response body
      final errorJson = jsonDecode(response.body);
      return Left(errorJson['message'] ?? 'Login gagal');
    }
  } catch (e) {
    return Left('Terjadi kesalahan: ${e.toString()}');
  }
}

  
}
