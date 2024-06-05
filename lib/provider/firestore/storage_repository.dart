import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/user_model.dart';

class StorageRepository {
  static const String userPath = 'user/profilePicture/';
  static const String eventPath = 'events/';

   /// The user selects a file, and the task is added to the list.
  Future<UploadTask?> uploadFile(PickedFile? file, String? id, {ImageUploadType type = ImageUploadType.profile}) async {
    if (file == null) {
      return null;
    }
    final Reference storgageRef = FirebaseStorage.instance.ref().child(type == ImageUploadType.profile ? '$userPath$id.jpg' : '$eventPath$id.jpg');
    final UploadTask uploadTask = storgageRef.putFile(File(file.path));
    return Future<UploadTask>.value(uploadTask);
  }

  /* Future<UploadTask?> uploadEventPicture(PickedFile? file, String? eventId) async {
    if (file == null) {
      return null;
    }
    final Reference storgageRef = FirebaseStorage.instance.ref().child('$eventPath$eventId.jpg');
    final UploadTask uploadTask = storgageRef.putFile(File(file.path));
    return Future<UploadTask>.value(uploadTask);
  } */

  Future<String> downloadLink(Reference ref) async {
    final String downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }

  Future<FFUser> deleteFile(FFUser profile) async {
    final Reference storageReference = FirebaseStorage.instance.ref().child('user/profilePicture/${profile.id}.jpg');
    await storageReference.delete();
    final FFUser userProfile = profile;
    userProfile.profilPicture = '';
    return userProfile;
    //BlocProvider.of<UserProfileBloc>(context).add(UpdateUserProfileEvent(userProfile, userProfile.userID));
  }
}