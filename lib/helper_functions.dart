import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class HelperFunctions {
  static bool isAdmin(Map<String, dynamic>? claims) {
    if (claims == null) return false;

    return (claims.containsKey('role') && claims.containsValue('ADMIN'));
  }

  static Timestamp dateTimeAsIs(Timestamp? dateTime) => dateTime ?? Timestamp.now(); //<-- pass through no need for generated code to perform any formatting

  // https://stackoverflow.com/questions/56627888/how-to-print-firestore-timestamp-as-formatted-date-and-time-in-flutter
  static Timestamp dateTimeFromTimestamp(Timestamp? timestamp) {
    return timestamp ?? Timestamp.now();
  }

  static int getAge(Timestamp birthday) {
    final DateTime currentLocalTime = DateTime.now();
    final Duration difference = currentLocalTime.difference(birthday.toDate());
    return ((difference.inDays / 365).toInt());
  }

  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissonns are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permisson are permantly denied, we cannot request Location');
    }
    return await Geolocator.getCurrentPosition();
  }
}
