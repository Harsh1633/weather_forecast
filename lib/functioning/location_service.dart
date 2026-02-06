import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {

  static Future<String> getCurrentCity() async {

    bool serviceEnabled;
    LocationPermission permission;

    // Check location services
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services disabled");
    }

    // Permission check
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw Exception("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission permanently denied");
    }

    // Get position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Convert to address (Reverse Geocoding)
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    final city = placemarks.first.locality; // Mumbai, Delhi etc

    return city ?? "";
  }
}
