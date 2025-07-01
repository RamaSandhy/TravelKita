import 'package:flutter/material.dart';
import 'features/travel/presentation/pages/search_page.dart';

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

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Setelah 3 detik pindah ke halaman pencarian
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SearchPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar selamat datang (gunakan gambar dari assets)
            Image.asset(
              'assets/images/travel_welcome.png', // Pastikan gambar ini ada di assets
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Selamat datang di TravelKita',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}