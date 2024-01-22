part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class CheckOnboardingEvent extends OnboardingEvent {}

class OnboardingDoneEvent extends OnboardingEvent {}

