import 'package:cloud_firestore/cloud_firestore.dart';

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
    return((difference.inDays / 365).toInt());
  }
}
