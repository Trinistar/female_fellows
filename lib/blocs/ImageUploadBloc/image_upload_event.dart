part of 'image_upload_bloc.dart';

sealed class ImageUploadEvent extends Equatable {
  const ImageUploadEvent();

  @override
  List<Object> get props => [];
}

class UploadImageEvent extends ImageUploadEvent {
  const UploadImageEvent(this.image, this.profile);

  final XFile image;
  final FFUser profile;

  @override
  List<Object> get props => <Object>[image, profile];
}

class DeleteImageEvent extends ImageUploadEvent {
  const DeleteImageEvent(this.profile);

  final FFUser profile;

  @override
  List<Object> get props => <Object>[profile];
}

class ImageUploadedEvent extends ImageUploadEvent {
  const ImageUploadedEvent(this.downloadURL);

  final String downloadURL;

  @override
  List<Object> get props => <Object>[downloadURL];
}

class ImageDeletedEvent extends ImageUploadEvent {
  const ImageDeletedEvent();

  @override
  List<Object> get props => <Object>[];
}