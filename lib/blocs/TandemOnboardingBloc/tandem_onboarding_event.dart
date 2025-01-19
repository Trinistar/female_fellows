part of 'tandem_onboarding_bloc.dart';

sealed class TandemOnboardingEvent extends Equatable {
  const TandemOnboardingEvent();

  @override
  List<Object> get props => [];
}

class CheckTandemOnboardingEvent extends TandemOnboardingEvent {
  CheckTandemOnboardingEvent({this.emailVerified = false});

  final bool emailVerified;
}

class TandemOnboardingDoneEvent extends TandemOnboardingEvent {}
