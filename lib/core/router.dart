// core/router.dart
import 'package:flutter/material.dart';
import 'package:travelkita/features/travel/domain/entities/jadwal_travel.dart';
import 'package:travelkita/features/travel/presentation/pages/booking_page.dart';
import 'package:travelkita/features/travel/presentation/pages/detail_travel_page.dart';
import 'package:travelkita/features/travel/presentation/pages/home_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());

      case '/booking':
        final jadwal = settings.arguments as JadwalTravel;
        return MaterialPageRoute(
          builder: (_) => BookingPage(jadwalTravel: jadwal),
        );

      case '/detail':
        final jadwal = settings.arguments as JadwalTravel;
        return MaterialPageRoute(
          builder: (_) => DetailTravelPage(jadwalTravel: jadwal),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Halaman tidak ditemukan')),
          ),
        );
    }
  }
}
