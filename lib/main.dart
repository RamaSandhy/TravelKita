import 'package:flutter/material.dart';
import 'core/router.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/travel/presentation/pages/home_page.dart';

void main() {
  runApp(const TravelKitaApp());
}

class TravelKitaApp extends StatelessWidget {
  const TravelKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelKita',
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
