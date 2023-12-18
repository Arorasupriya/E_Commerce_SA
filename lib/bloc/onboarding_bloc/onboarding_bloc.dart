import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/api_helper/api_exceptiion_handler.dart';
import 'package:e_commerce_app/api_helper/api_helper.dart';
import 'package:e_commerce_app/api_helper/app_variables.dart';
import 'package:e_commerce_app/models/onboarding_model/signin.dart';
import 'package:e_commerce_app/models/onboarding_model/signup_model.dart';
import 'package:e_commerce_app/sharedpreference/sharedpreference.dart';

part 'onboarding_event.dart';

part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitialState()) {
    on<CallSignUpAPI>((event, emit) async {
      emit(OnboardingLoadingState());
      try {
        var res = await ApiHelper.postApiWithParameterAuth(
            strURL: AppVariables.registerURL, body: event.signUpModel.toJson());
        emit(OnboardingSignUpLoadedState(oSURes: res));
        print("res token ${res["token"]}");
        //  MySharedPreference().setSharedPrefValue("${res["token"]}");
      } catch (e) {
        print("E===> $e");
        emit(OnboardingErrorState(error: (e as MyException).ToString()));
      }
    });

    on<CallSignInAPI>((event, emit) async {
      emit(OnboardingLoadingState());

      try {
        var res = await ApiHelper.postApiWithParameterAuth(
            strURL: AppVariables.loginURL, body: event.signInModel.toJson());
        print("res token ${res["token"]}");
        MySharedPreference().setSharedPrefValue(strToken: "${res["token"]}");
        emit(OnboardingSignInLoadedState(oSIRes: res));
      } catch (e) {
        emit(OnboardingErrorState(error: (e as MyException).ToString()));
      }
    });
  }
}
