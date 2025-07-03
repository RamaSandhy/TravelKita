import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/login_bloc.dart';
import '../../bloc/login_event.dart';
import '../../bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login TravelKita')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (_) => LoginBloc(),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                // Navigasi ke HomePage atau Dashboard
                Navigator.pushReplacementNamed(context, '/home');
              } else if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    state is LoginLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                final email = _emailController.text.trim();
                                final password = _passwordController.text.trim();

                                context.read<LoginBloc>().add(
                                      LoginSubmitted(email, password),
                                    );
                              },
                              child: const Text('Login'),
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
