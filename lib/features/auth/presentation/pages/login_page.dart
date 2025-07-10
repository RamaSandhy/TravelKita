// presentation/auth/login_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelkita/features/auth/bloc/login_bloc.dart';
import 'package:travelkita/features/auth/bloc/login_event.dart';
import 'package:travelkita/features/auth/bloc/login_state.dart';
import 'package:travelkita/features/auth/data/repositories/auth_repository.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(repository: AuthRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login berhasil')),
              );

              // Cek role user lalu navigasi sesuai role
              if (state.user.role == 'admin') {
                // Navigasi ke halaman admin (misal sementara ke /menu dulu)
                // Navigator.pushReplacementNamed(context, '/home');
              } else {
                // User biasa diarahkan ke homepage
                Navigator.pushReplacementNamed(context, '/menu');
              }
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login gagal: ${state.error}')),
              );
            }
          },

          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            final email = emailController.text;
                            final password = passwordController.text;

                            context.read<AuthBloc>().add(
                                  LoginSubmitted(email: email, password: password),
                                );
                          },
                          child: const Text('Login'),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
