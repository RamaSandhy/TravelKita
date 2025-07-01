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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingBloc(BookingRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Booking Kursi')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              Text('${widget.jadwal.asal} → ${widget.jadwal.tujuan}'),
              Text('Tanggal: ${widget.jadwal.tanggal} | Jam: ${widget.jadwal.jam}'),
              Text('Harga: Rp${widget.jadwal.harga}'),
              const SizedBox(height: 16),
              const Text('Pilih Kursi:'),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(6, (index) {
                  final kursi = 'A${index + 1}';
                  return ChoiceChip(
                    label: Text(kursi),
                    selected: selectedSeat == kursi,
                    onSelected: (_) {
                      setState(() {
                        selectedSeat = kursi;
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: 16),