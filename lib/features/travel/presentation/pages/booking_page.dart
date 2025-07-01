import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/booking_bloc.dart';
import '../../data/repositories/booking_repository.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/jadwal_travel.dart';

class BookingPage extends StatefulWidget {
  final JadwalTravel jadwal;
  const BookingPage({super.key, required this.jadwal});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String? selectedSeat;
  final TextEditingController namaController = TextEditingController();
