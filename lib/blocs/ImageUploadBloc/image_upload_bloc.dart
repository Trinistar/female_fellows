import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:femalefellows/models/enums.dart';
import 'package:femalefellows/models/events.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:femalefellows/provider/firebase/firestore_event_repository.dart';
import 'package:femalefellows/provider/firebase/firestore_user_profile_repository.dart';
import 'package:femalefellows/provider/firebase/storage_repository.dart';

part 'image_upload_event.dart';
part 'image_upload_state.dart';

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  ImageUploadBloc() : super(ImageUploadInitial()) {
    on<UploadImageEvent>(_onUploadImageEvent);
    on<UploadEventImageEvent>(_onUploadEventImageEvent);
    on<DeleteImageEvent>(_onDeleteImageEvent);
    on<DeleteEventImageEvent>(_onDeleteEventImageEvent);
  }

  final StorageRepository _storageImageRepo = StorageRepository();

  final FirestoreUserProfileRepository _userRepo = FirestoreUserProfileRepository();
  final FirestoreEventRepository _firestoreEventRepository = FirestoreEventRepository();


  Future<void> _onUploadImageEvent(UploadImageEvent event, Emitter<ImageUploadState> emit) async {
    emit(ImageUploading());
    try {
      final PickedFile file = PickedFile(event.image.path);
      final UploadTask? task = await _storageImageRepo.uploadFile(file, event.profile.id, type: event.imageUploadType);

      if (task != null) {
        return emit.onEach(
          task.snapshotEvents,
          onData: (TaskSnapshot snapshot) async {
            final Reference ref = snapshot.ref;
            if (ref.bucket.isNotEmpty) {
              final String downloadUrl = await ref.getDownloadURL();
              event.profile.profilPicture = downloadUrl;
              await _userRepo.updateUserProfile(event.profile, userID: event.profile.id!);
              emit(ImageUploaded(downloadUrl));
            }
          },
          onError: (Object o, StackTrace s) => emit(ImageNotUploaded()),
        );
      }
    } catch (_) {
      emit(ImageNotUploaded());
    }
  }

  Future<void> _onUploadEventImageEvent(UploadEventImageEvent event, Emitter<ImageUploadState> emit) async {
    emit(ImageUploading());

    try {
      final PickedFile file = PickedFile(event.image.path);
      final UploadTask? task = await _storageImageRepo.uploadFile(file, event.event.id, type: event.imageUploadType);

      if (task != null) {
        return emit.onEach(
          task.snapshotEvents,
          onData: (TaskSnapshot snapshot) async {
            final Reference ref = snapshot.ref;
            if (ref.bucket.isNotEmpty) {
              final String downloadUrl = await ref.getDownloadURL();
              event.event.picture = downloadUrl;
              await _firestoreEventRepository.updateEvent(event.event);
              emit(ImageUploaded(downloadUrl));
            }
          },
          onError: (Object o, StackTrace s) => emit(ImageNotUploaded()),
        );
      }
    } catch (_) {
      emit(ImageNotUploaded());
    }
  }

  Future<void> _onDeleteImageEvent(DeleteImageEvent event, Emitter<ImageUploadState> emit) async {
    emit(ImageUploading());

    try {
      await _storageImageRepo.deleteFile(event.profile.id!);
      event.profile.profilPicture = '';
      await _userRepo.updateUserProfile(event.profile, userID: event.profile.id!);
      emit(ImageDeleted());
    } catch (_) {
      emit(ImageNotDeleted());
    }
  }

  Future<void> _onDeleteEventImageEvent(DeleteEventImageEvent event, Emitter<ImageUploadState> emit) async {
    emit(ImageUploading());

    try {
      await _storageImageRepo.deleteFile(event.event.id!);
      event.event.picture = '';
      await _firestoreEventRepository.updateEvent(event.event);
      emit(ImageDeleted());
    } catch (_) {
      emit(ImageNotDeleted());
    }
  }
}
