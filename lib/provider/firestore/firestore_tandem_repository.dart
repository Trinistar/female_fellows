import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/tandem_match.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_repository.dart';

class FirestoreTandemRepository {
  final FirebaseFirestore db;
  FirestoreTandemRepository() : db = FirestoreRepository().firestoreInstance;

  Future<void> setTandemMatch(TandemMatch match, LocalOrNewcomer lon) async {
    var doc = await db.collection('tandemMatches').where(lon == LocalOrNewcomer.local ? 'local' : 'newcomer', isEqualTo: match.requester).get();
    if (doc.docs.isEmpty || doc.docs.first['enabled'] == false) {
      db.collection('tandemMatches').doc().set(match.toJson());
    } else {
      print('doc exists');
    }
  }
}
