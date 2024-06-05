import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/tandem_match.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/provider/firebase/firestore_repository.dart';

class FirestoreTandemRepository {
  final FirebaseFirestore db;
  FirestoreTandemRepository() : db = FirestoreRepository().firestoreInstance;

  Future<void> setTandemMatch(Map<String, dynamic> match, FFUser profile, String? otherId) async {
    var doc = await db
        .collection('tandemMatches')
        .where(profile.localOrNewcomer == LocalOrNewcomer.local ? 'local' : 'newcomer', isEqualTo: profile.id)
        .where(profile.localOrNewcomer == LocalOrNewcomer.local ? 'newcomer' : 'local', isEqualTo: otherId)
        .get();
    if (doc.docs.isEmpty) {
      db.collection('tandemMatches').doc().set(match, SetOptions(merge: true));
    } else {
      db.collection('tandemMatches').doc(doc.docs.first.id).set(match, SetOptions(merge: true));
    }
  }
}
