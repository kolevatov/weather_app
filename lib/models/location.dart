import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  bool permissionEnabled = true;
  String? reason;

  // check permissions for GEO location service
  Future<void> getPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permissionEnabled = false;
      reason = 'Location services are disabled';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permissionEnabled = false;
        reason = 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      permissionEnabled = false;
      reason =
          'Location permissions are permanently denied, we cannot request permissions';
    }
  }

  // get current GEO location
  Future<void> getCurrentLocation() async {
    // check for permission
    await getPermission();

    if (permissionEnabled) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);

        latitude = position.latitude;
        longitude = position.longitude;
      } catch (error) {
        log('Error during location detection: $error');
      }
    }
  }
}
