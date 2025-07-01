import '../../domain/entities/booking.dart';

class BookingRepository {
  Future<bool> createBooking(Booking booking) async {
    // Simulasi pemesanan, diimplementasikan sebagai delay
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}