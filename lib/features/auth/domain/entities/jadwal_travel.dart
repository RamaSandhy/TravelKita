class JadwalTravel {
  final int id;
  final String asal;
  final String tujuan;
  final String tanggal;
  final String jam;
  final int harga;
  final String armada;

  JadwalTravel({
    required this.id,
    required this.asal,
    required this.tujuan,
    required this.tanggal,
    required this.jam,
    required this.harga,
    required this.armada,
  });

  factory JadwalTravel.fromJson(Map<String, dynamic> json) {
    return JadwalTravel(
      id: json['id'],
      asal: json['asal'],
      tujuan: json['tujuan'],
      tanggal: json['tanggal'],
      jam: json['jam'],
      harga: json['harga'],
      armada: json['armada'],
    );
  }
}