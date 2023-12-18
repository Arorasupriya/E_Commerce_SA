part of 'onboarding_bloc.dart';

abstract class OnboardingState {}

class OnboardingInitialState extends OnboardingState {}

class OnboardingLoadingState extends OnboardingState {}

class OnboardingSignUpLoadedState extends OnboardingState {
  Map<String, dynamic>? oSURes;
  OnboardingSignUpLoadedState({required this.oSURes});
}

class OnboardingSignInLoadedState extends OnboardingState {
  Map<String, dynamic>? oSIRes;
  OnboardingSignInLoadedState({required this.oSIRes});
}

class OnboardingErrorState extends OnboardingState {
  String? error;
  OnboardingErrorState({required this.error});
}
