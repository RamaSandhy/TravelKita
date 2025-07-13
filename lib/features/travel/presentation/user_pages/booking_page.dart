import 'package:flutter/material.dart';
import '../../domain/entities/jadwal_travel.dart';

class BookingPage extends StatefulWidget {
  final JadwalTravel jadwalTravel;

  const BookingPage({super.key, required this.jadwalTravel});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedSeat;
  final _namaController = TextEditingController();
  final _nomorHpController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nomorHpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> seatOptions = List.generate(
      widget.jadwalTravel.kursiTersedia,
      (index) => 'Kursi ${index + 1}',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Tiket'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Info Travel
              Text(
                '${widget.jadwalTravel.kotaAsal} → ${widget.jadwalTravel.kotaTujuan}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Jam Berangkat: ${widget.jadwalTravel.jamKeberangkatan}'),
              Text('Harga: Rp ${_formatPrice(widget.jadwalTravel.harga)}'),
              const SizedBox(height: 20),

              // Nama
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Nama wajib diisi' : null,
              ),
              const SizedBox(height: 16),

              // Nomor HP
              TextFormField(
                controller: _nomorHpController,
                decoration: const InputDecoration(
                  labelText: 'Nomor HP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Nomor HP wajib diisi' : null,
              ),
              const SizedBox(height: 16),

              // Pilih Kursi
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Pilih Kursi',
                  border: OutlineInputBorder(),
                ),
                items: seatOptions
                    .map((seat) => DropdownMenuItem(
                          value: seat,
                          child: Text(seat),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => selectedSeat = value),
                validator: (value) =>
                    value == null ? 'Pilih kursi terlebih dahulu' : null,
              ),
              const SizedBox(height: 30),

              // Tombol Booking
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Konfirmasi Booking'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
  }

  void _submitBooking() {
    if (_formKey.currentState!.validate()) {
      final nama = _namaController.text;
      final hp = _nomorHpController.text;

      // TODO: Simpan ke backend atau local DB
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Booking Berhasil'),
          content: Text(
              'Terima kasih $nama!\nBooking untuk ${selectedSeat!} telah dikonfirmasi.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
              child: const Text('Kembali ke Beranda'),
            )
          ],
        ),
      );
    }
  }
}
