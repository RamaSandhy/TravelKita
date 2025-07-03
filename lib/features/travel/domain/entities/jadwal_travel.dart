class JadwalTravel {
  final String id;
  final String kotaAsal;
  final String kotaTujuan;
  final DateTime tanggal;
  final String jamKeberangkatan;
  final int harga;
  final String tipeMobil;
  final int kapasitas;
  final int kursiTersedia;

  JadwalTravel({
    required this.id,
    required this.kotaAsal,
    required this.kotaTujuan,
    required this.tanggal,
    required this.jamKeberangkatan,
    required this.harga,
    required this.tipeMobil,
    required this.kapasitas,
    required this.kursiTersedia,
  });

  factory JadwalTravel.fromJson(Map<String, dynamic> json) {
    return JadwalTravel(
      id: json['id'],
      kotaAsal: json['kota_asal'],
      kotaTujuan: json['kota_tujuan'],
      tanggal: DateTime.parse(json['tanggal']),
      jamKeberangkatan: json['jam_keberangkatan'],
      harga: json['harga'],
      tipeMobil: json['tipe_mobil'],
      kapasitas: json['kapasitas'],
      kursiTersedia: json['kursi_tersedia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kota_asal': kotaAsal,
      'kota_tujuan': kotaTujuan,
      'tanggal': tanggal.toIso8601String(),
      'jam_keberangkatan': jamKeberangkatan,
      'harga': harga,
      'tipe_mobil': tipeMobil,
      'kapasitas': kapasitas,
      'kursi_tersedia': kursiTersedia,
    };
  }
}