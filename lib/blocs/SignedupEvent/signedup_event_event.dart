part of 'signedup_event_bloc.dart';

sealed class SignedupEventEvents extends Equatable {
  const SignedupEventEvents();

  @override
  List<Object> get props => [];
}

class LoadSignedupEvents extends SignedupEventEvents {
  const LoadSignedupEvents(this.profile);

  final FFUser profile;

    @override
  List<Object> get props => <Object>[profile];
}

class UnloadSignedUpEvents extends SignedupEventEvents {
  
    @override
  List<Object> get props => <Object>[];
}
