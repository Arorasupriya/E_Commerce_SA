import 'dart:async';
import 'package:e_commerce_app/api_helper/api_helper.dart';
import 'package:e_commerce_app/api_helper/app_variables.dart';
import 'package:e_commerce_app/helper_classes/my_text_styles.dart';
import 'package:e_commerce_app/models/config_models/data_model_class.dart';
import 'package:e_commerce_app/screens/dashboard_screens/dashboard_home.dart';
import 'package:e_commerce_app/screens/onbording_screens/login_screen.dart';
import 'package:e_commerce_app/screens/onbording_screens/signup_screen.dart';
import 'package:e_commerce_app/sharedpreference/sharedpreference.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  ConfigDataModel? configApiRes;

  @override
  void initState() {
    super.initState();
    getConfigAIPData();
  }

  getConfigAIPData() async {
    var data = await ApiHelper.getApiRequest(strUrl: AppVariables.configURL);
    configApiRes = ConfigDataModel.fromJson(data);
    print("Data====>$configApiRes");
    AppVariables.baseUrls = configApiRes!.baseUrls!;
    var strUserToken = await MySharedPreference().getSharedPreferenceValue();
    print("token splash 1 method $strUserToken");
    setState(() {});
    holdScreen();
  }

  holdScreen() async {
    var strUserToken = await MySharedPreference().getSharedPreferenceValue();
    if (strUserToken.isNotEmpty) {
      print("Splash screen print strUserToken ==> $strUserToken");
      Timer(const Duration(seconds: 4), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()));
      });
    } else {
      print("Splash screen print strUserToken ==> $strUserToken");
      Timer(const Duration(seconds: 4), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return configApiRes == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Lottie.asset(
                    "assets/animations/Animation - 1701769169432.json",
                    height: deviceHeight,
                    width: deviceWidth,
                    repeat: true,
                    reverse: true,
                  ),
                  Positioned(
                      left: deviceWidth * 0.25,
                      top: deviceHeight * 0.7,
                      child: Text("E Commerce",
                          style: mTextStyle25(
                              mWeight: FontWeight.bold,
                              mFontColor: Colors.purple))),
                ],
              ),
            ),
          );
  }
}
