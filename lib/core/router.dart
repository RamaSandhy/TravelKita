import 'package:flutter/material.dart';
import 'package:travelkita/features/auth/presentation/pages/login_page.dart';
import 'package:travelkita/features/travel/domain/entities/jadwal_travel.dart';
import 'package:travelkita/features/travel/presentation/user_pages/home_page.dart';
import 'package:travelkita/features/travel/presentation/user_pages/booking_page.dart';
import 'package:travelkita/features/travel/presentation/user_pages/detail_travel_page.dart';
import 'package:travelkita/features/travel/presentation/user_pages/home_menu_page.dart'; // ini halaman awal

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>  LoginPage());

      // User
      case '/menu':
        return MaterialPageRoute(builder: (_) => const HomeMenuPage());

      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage()); // ← tambahkan ini

      case '/detail':
        final jadwal = settings.arguments as JadwalTravel;
        return MaterialPageRoute(
          builder: (_) => DetailTravelPage(jadwalTravel: jadwal),
        );

      case '/booking':
        final jadwal = settings.arguments as JadwalTravel;
        return MaterialPageRoute(
          builder: (_) => BookingPage(jadwalTravel: jadwal),
        );

      // Admin

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Halaman tidak ditemukan')),
          ),
        );
    }
  }
}
