import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/jadwal_travel.dart';

class JadwalRepository {
  Future<List<JadwalTravel>> fetchJadwal(String asal, String tujuan, String tanggal) async {
    final response = await http.get(Uri.parse('https://example.com/api/jadwal?asal=$asal&tujuan=$tujuan&tanggal=$tanggal'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => JadwalTravel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat jadwal travel');
    }
  }
}