// presentation/bloc/auth_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:travelkita/features/auth/bloc/login_event.dart';
import 'package:travelkita/features/auth/bloc/login_state.dart';
import 'package:travelkita/features/auth/data/models/request/login_request_model.dart';
import 'package:travelkita/features/auth/data/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());

      final result = await repository.login(
        LoginRequestModel(email: event.email, password: event.password),
      );

      // result.fold ini bisa async juga, jadi pastikan pakai async di closure
      await result.fold(
        (failure) async {
          emit(AuthFailure(failure));
        },
        (loginResponse) async {
          await secureStorage.write(key: 'token', value: loginResponse.token);
          emit(AuthSuccess(user: loginResponse));
        },
      );
    });

  }
}
