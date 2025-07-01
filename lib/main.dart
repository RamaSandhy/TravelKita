import 'package:flutter/material.dart';
import 'travelkita/features/travel/presentation/pages/search_page.dart';

void main() {
  runApp(const TravelKitaApp());
}

class TravelKitaApp extends StatelessWidget {
  const TravelKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelKita',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchPage(),
    );
  }
}