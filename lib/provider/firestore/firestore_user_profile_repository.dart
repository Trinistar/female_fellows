import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_repository.dart';
import 'package:vs_femalefellows/models/user_model.dart';

class FirestoreUserProfileRepository {
  Future<void> updateUserProfile(
    FFUser userProfile, {
    required String userID,
  }) async {
    return FirestoreRepository().firestoreInstance.collection('user').doc(userID).set(userProfile.toJson(), SetOptions(merge: true));
  }

  Stream<FFUser?> loadUserProfile(String userID) {
    return FirestoreRepository().firestoreInstance.collection('user').doc(userID).snapshots().map((DocumentSnapshot<Object> snapshot) {
      if (snapshot.exists) {
        final FFUser userProfile = FFUser.fromJson(snapshot.data()! as Map<String, dynamic>);
        return userProfile;
      } else {
        return null;
      }
    });
  }

  Stream<List<FFUser>> getAllTandems(String localOrNewcomer) {
    return FirestoreRepository().firestoreInstance
    .collection('user')
    .where('localOrNewcomer', isEqualTo: localOrNewcomer)
    .snapshots()
    .map(
      ((QuerySnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.docs.isNotEmpty) {
          List<FFUser> tmp = [];

          for (var change in snapshot.docChanges) {
            final FFUser user = FFUser.fromJson(change.doc.data()!);
            user.id = change.doc.id;
            tmp.add(user);
          }
          return tmp;
        } else {
          return [];
        }
      }),
    );
  }
}
