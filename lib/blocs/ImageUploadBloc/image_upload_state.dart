part of 'image_upload_bloc.dart';

sealed class ImageUploadState extends Equatable {
  const ImageUploadState();
  
  @override
  List<Object> get props => [];
}

final class ImageUploadInitial extends ImageUploadState {}

class ImageUploading extends ImageUploadState {}

class ImageUploaded extends ImageUploadState {
  const ImageUploaded(this.downloadURL);

  final String downloadURL;

  @override
  List<Object> get props => <Object>[downloadURL];
}

class ImageDeleted extends ImageUploadState {}

class ImageNotUploaded extends ImageUploadState {}

class ImageNotDeleted extends ImageUploadState {}