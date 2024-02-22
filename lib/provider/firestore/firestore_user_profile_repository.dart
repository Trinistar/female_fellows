import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/tandem_match.dart';
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
        userProfile.id = userID;
        return userProfile;
      } else {
        return null;
      }
    });
  }

  Stream<UserLocation?> loadUserProfileLocationData(String userId) {
    return FirestoreRepository().firestoreInstance.collection('user/$userId/data').doc('geodata').snapshots().map((DocumentSnapshot<Object> snapshot) {
      if (snapshot.exists) {
        final UserLocation userLocation = UserLocation.fromJson(snapshot.data()! as Map<String, dynamic>);
        return userLocation;
      } else {
        return null;
      }
    });
  }

  Stream<List<TandemMatch>?> loadTandemMatches(String userId, LocalOrNewcomer lon) {
    return FirestoreRepository().firestoreInstance.collection('tandemMatches').where(lon == LocalOrNewcomer.local ? 'local' : 'newcomer', isEqualTo: userId).snapshots().map((QuerySnapshot<Object> snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final List<TandemMatch> matches = [];
        for (final DocumentSnapshot<Object> doc in snapshot.docs) {
          final TandemMatch match = TandemMatch.fromJson(doc.data()! as Map<String, dynamic>);
          matches.add(match);
        }
        return matches;
      } else {
        return null;
      }
    });
  }

  Future<UserLocation?> getUserLocation(String userId) async {
    try {
      final locationRaw = await FirestoreRepository().firestoreInstance.collection('user/$userId/data').doc('geodata').get();
      final UserLocation location = UserLocation.fromJson(locationRaw.data()!);
      return location;
    } catch (e) {
      return null;
    }
  }

  Future<void> setUserLocation(String userId, UserLocation location) async {
    try {
      await FirestoreRepository().firestoreInstance.collection('user/$userId/data').doc('geodata').set(location.toJson(), SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Stream<List<FFUser>> getAllTandems(String localOrNewcomer) {
    return FirestoreRepository().firestoreInstance.collection('user').where('localOrNewcomer', isEqualTo: localOrNewcomer).snapshots().map(
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
