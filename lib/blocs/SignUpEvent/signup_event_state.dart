part of 'signup_event_bloc.dart';

sealed class SignupEventState extends Equatable {
  const SignupEventState();
  
  @override
  List<Object> get props => [];
}

final class SignupEventInitial extends SignupEventState {}
