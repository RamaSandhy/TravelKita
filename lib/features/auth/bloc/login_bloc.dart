import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(const Duration(seconds: 2)); // Simulasi login

      // Simulasi validasi sederhana
      if (event.email == 'user@example.com' && event.password == '123456') {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure('Email atau password salah'));
      }
    });
  }
}