import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelkita/features/auth/bloc/login_bloc.dart';
import 'package:travelkita/features/auth/data/repositories/auth_repository.dart';
import 'core/router.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/travel/presentation/user_pages/home_page.dart';

void main() {
  runApp(const TravelKitaApp());
}

class TravelKitaApp extends StatelessWidget {
  const TravelKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(repository: AuthRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'TravelKita',
        initialRoute: '/',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
