import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cari Travel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Kota Asal'),
            const TextField(decoration: InputDecoration(hintText: 'Masukkan kota asal')),
            const SizedBox(height: 12),
            const Text('Kota Tujuan'),
            const TextField(decoration: InputDecoration(hintText: 'Masukkan kota tujuan')),
            const SizedBox(height: 12),
            const Text('Tanggal Berangkat'),
            const TextField(decoration: InputDecoration(hintText: 'Pilih tanggal')),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Cari Jadwal'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
