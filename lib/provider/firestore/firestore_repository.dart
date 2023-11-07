import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  factory FirestoreRepository() {
    return _singleton;
  }

  FirestoreRepository._internal();

  static final FirestoreRepository _singleton = FirestoreRepository._internal();

  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
}
