import 'package:geocoding/geocoding.dart';

Future<String?> getNearbyLocationName(double latitude, double longitude) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longitude);
  Placemark placemark = placemarks[4];
  return placemark.locality ?? placemark.administrativeArea;
}
