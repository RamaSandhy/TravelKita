class Booking {
  final int id;
  final int jadwalId;
  final String nama;
  final String kursi;

  Booking({
    required this.id,
    required this.jadwalId,
    required this.nama,
    required this.kursi,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jadwalId': jadwalId,
      'nama': nama,
      'kursi': kursi,
    };
  }
}