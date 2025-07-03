import 'package:flutter/material.dart';
import '../../domain/entities/jadwal_travel.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<JadwalTravel> daftarJadwal = [
      JadwalTravel(
        id: '1',
        kotaAsal: 'Pacitan',
        kotaTujuan: 'Yogyakarta',
        tanggal: DateTime.now(),
        jamKeberangkatan: '08:00',
        harga: 100000,
        tipeMobil: 'Avanza',
        kapasitas: 6,
        kursiTersedia: 4,
      ),
      JadwalTravel(
        id: '2',
        kotaAsal: 'Yogyakarta',
        kotaTujuan: 'Pacitan',
        tanggal: DateTime.now(),
        jamKeberangkatan: '09:00',
        harga: 100000,
        tipeMobil: 'Xenia',
        kapasitas: 6,
        kursiTersedia: 3,
      ),
      JadwalTravel(
        id: '3',
        kotaAsal: 'Pacitan',
        kotaTujuan: 'Solo',
        tanggal: DateTime.now(),
        jamKeberangkatan: '10:00',
        harga: 150000,
        tipeMobil: 'Innova',
        kapasitas: 7,
        kursiTersedia: 2,
      ),
      JadwalTravel(
        id: '4',
        kotaAsal: 'Solo',
        kotaTujuan: 'Pacitan',
        tanggal: DateTime.now(),
        jamKeberangkatan: '11:00',
        harga: 100000,
        tipeMobil: 'Avanza',
        kapasitas: 6,
        kursiTersedia: 1,
      ),
      JadwalTravel(
        id: '5',
        kotaAsal: 'Pacitan',
        kotaTujuan: 'Malang',
        tanggal: DateTime.now(),
        jamKeberangkatan: '12:00',
        harga: 300000,
        tipeMobil: 'Xenia',
        kapasitas: 6,
        kursiTersedia: 5,
      ),
      JadwalTravel(
        id: '6',
        kotaAsal: 'Malang',
        kotaTujuan: 'Pacitan',
        tanggal: DateTime.now(),
        jamKeberangkatan: '13:00',
        harga: 220000,
        tipeMobil: 'Innova',
        kapasitas: 7,
        kursiTersedia: 2,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('TravelKita - Home')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarJadwal.length,
        itemBuilder: (context, index) {
          final jadwal = daftarJadwal[index];
          return Card(
            child: ListTile(
              title: Text('${jadwal.kotaAsal} → ${jadwal.kotaTujuan}'),
              subtitle: Text('Berangkat: ${jadwal.jamKeberangkatan}'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: jadwal,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
