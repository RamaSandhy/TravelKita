import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/jadwal_bloc.dart';
import '../../data/repositories/jadwal_repository.dart';
import '../../domain/entities/jadwal_travel.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController asalController = TextEditingController();
    final TextEditingController tujuanController = TextEditingController();
    final TextEditingController tanggalController = TextEditingController();

    return BlocProvider(
      create: (context) => JadwalBloc(JadwalRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Cari Jadwal Travel')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: asalController,
                decoration: const InputDecoration(labelText: 'Kota Asal'),
              ),
              TextField(
                controller: tujuanController,
                decoration: const InputDecoration(labelText: 'Kota Tujuan'),
              ),
              TextField(
                controller: tanggalController,
                decoration: const InputDecoration(labelText: 'Tanggal (YYYY-MM-DD)'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  context.read<JadwalBloc>().add(
                    SearchJadwal(
                      asalController.text,
                      tujuanController.text,
                      tanggalController.text,
                    ),
                  );
                },
                child: const Text('Cari Jadwal'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<JadwalBloc, JadwalState>(
                  builder: (context, state) {
                    if (state is JadwalLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is JadwalLoaded) {
                      return ListView.builder(
                        itemCount: state.results.length,
                        itemBuilder: (context, index) {
                          final jadwal = state.results[index];
                          return ListTile(
                            title: Text('${jadwal.asal} → ${jadwal.tujuan}'),
                            subtitle: Text('${jadwal.tanggal} - ${jadwal.jam}'),
                            trailing: Text('Rp${jadwal.harga}'),
                          );
                        },
                      );
                    } else if (state is JadwalError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}