import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_repository.dart';

import '../../models/events.dart';


class FirestorEventRepository {
  Future<void> updateEvent(
  Event eventdata, {
    required String userID,
  }) async {
    return FirestoreRepository().firestoreInstance.collection('event').doc(userID).set(eventdata.toJson(), SetOptions(merge: true));
  }
}