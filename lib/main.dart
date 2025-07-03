import 'package:flutter/material.dart';
import 'core/router.dart';

void main() {
  runApp(const TravelKitaApp());
}

class TravelKitaApp extends StatelessWidget {
  const TravelKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelKita',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
