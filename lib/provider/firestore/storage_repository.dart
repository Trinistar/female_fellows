import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vs_femalefellows/models/user_model.dart';

class StorageRepository {
   /// The user selects a file, and the task is added to the list.
  Future<UploadTask?> uploadFile(PickedFile? file, String? userId) async {
    if (file == null) {
      return null;
    }
    final Reference storgageRef = FirebaseStorage.instance.ref().child('user/profilePicture/$userId.jpg');
    final UploadTask uploadTask = storgageRef.putFile(File(file.path));
    return Future<UploadTask>.value(uploadTask);
  }

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