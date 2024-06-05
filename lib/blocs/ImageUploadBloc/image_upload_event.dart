part of 'image_upload_bloc.dart';

sealed class ImageUploadEvent extends Equatable {
  const ImageUploadEvent();

  @override
  List<Object> get props => [];
}

class UploadImageEvent extends ImageUploadEvent {
  const UploadImageEvent(this.image, this.profile, {this.imageUploadType = ImageUploadType.profile});

  final XFile image;
  final FFUser profile;
  final ImageUploadType imageUploadType;

  @override
  List<Object> get props => <Object>[image, profile, imageUploadType];
}

class UploadEventImageEvent extends ImageUploadEvent {
  const UploadEventImageEvent(this.image, this.event, {this.imageUploadType = ImageUploadType.profile});

  final XFile image;
  final Event event;
  final ImageUploadType imageUploadType;

  @override
  List<Object> get props => <Object>[image, event, imageUploadType];
}

class DeleteImageEvent extends ImageUploadEvent {
  const DeleteImageEvent(this.profile);

  final FFUser profile;

  @override
  List<Object> get props => <Object>[profile];
}

class DeleteEventImageEvent extends ImageUploadEvent {
  const DeleteEventImageEvent(this.event);

  final Event event;

  @override
  List<Object> get props => <Object>[event];
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