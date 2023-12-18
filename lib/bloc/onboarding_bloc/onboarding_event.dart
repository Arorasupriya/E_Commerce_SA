part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {}

class CallSignUpAPI extends OnboardingEvent {
  SignUpModel signUpModel;
  CallSignUpAPI({required this.signUpModel});
}

class CallSignInAPI extends OnboardingEvent {
  SignInModel signInModel;
  CallSignInAPI({required this.signInModel});
}
