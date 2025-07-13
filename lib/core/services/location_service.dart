import 'dart:math' show sin, cos, sqrt, atan2, pi;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc; 
import 'package:permission_handler/permission_handler.dart'; 
import 'package:travelkita/features/auth/data/models/location/travel_destination.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  final loc.Location _location = loc.Location(); // <-- Gunakan 'loc.Location()'

  Future<bool> checkLocationPermissions() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return false;
    }

    // Gunakan PermissionStatus dari 'location' secara eksplisit
    loc.PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) { // <-- Gunakan 'loc.PermissionStatus.denied'
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) return false; // <-- Gunakan 'loc.PermissionStatus.granted'
    }

    return true;
  }

  /// Mengambil lokasi saat ini (dengan alamat jika memungkinkan)
  Future<LocationModel?> getCurrentLocation() async {
    try {
      final hasPermission = await checkLocationPermissions();
      if (!hasPermission) throw Exception('Location permission denied');

      final locationData = await _location.getLocation();

      if (locationData.latitude != null && locationData.longitude != null) {
        final address = await getAddressFromCoordinates(
          locationData.latitude!,
          locationData.longitude!,
        );

        return LocationModel(
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
          address: address,
          timestamp: DateTime.now(),
        );
      }

      return null;
    } catch (e) {
      print('Error getting current location: $e');
      return null;
    }
  }

  /// Mengonversi koordinat ke alamat (reverse geocoding)
  Future<String?> getAddressFromCoordinates(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return '${place.street}, ${place.subLocality}, '
            '${place.locality}, ${place.administrativeArea}, ${place.country}';
      }
      return null;
    } catch (e) {
      print('Error getting address: $e');
      return null;
    }
  }

  /// Mengonversi alamat ke koordinat (forward geocoding)
  Future<LocationModel?> getCoordinatesFromAddress(String address) async {
    try {
      final locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        final location = locations.first;
        return LocationModel(
          latitude: location.latitude,
          longitude: location.longitude,
          address: address,
          timestamp: DateTime.now(),
        );
      }
      return null;
    } catch (e) {
      print('Error getting coordinates: $e');
      return null;
    }
  }

  /// Stream lokasi real-time (dipakai untuk tracking)
  Stream<LocationModel> getLocationStream() {
    return _location.onLocationChanged.map((locationData) {
      return LocationModel(
        latitude: locationData.latitude ?? 0.0,
        longitude: locationData.longitude ?? 0.0,
        timestamp: DateTime.now(),
      );
    });
  }

  /// Menghitung jarak antara dua titik dalam kilometer
  double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const earthRadius = 6371.0;

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) *
            sin(dLon / 2) * sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * (pi / 180);
}