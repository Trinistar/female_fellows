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
}

