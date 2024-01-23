part of 'onboarding_bloc.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();
  
  @override
  List<Object> get props => [];
}

final class OnboardingInitial extends OnboardingState {}

final class IsOnboardingState extends OnboardingState {}

final class OnboardingDoneState extends OnboardingState {}
