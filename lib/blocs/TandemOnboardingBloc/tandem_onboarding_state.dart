part of 'tandem_onboarding_bloc.dart';

sealed class TandemOnboardingState extends Equatable {
  const TandemOnboardingState();
  
  @override
  List<Object> get props => [];
}

final class TandemOnboardingInitial extends TandemOnboardingState {}

final class IsTandemOnboardingState extends TandemOnboardingState {}

final class TandemOnboardingDoneState extends TandemOnboardingState {}