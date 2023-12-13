import 'dart:async';

import 'package:e_commerce_app/api_helper/APIHelper.dart';
import 'package:e_commerce_app/api_helper/app_variables.dart';
import 'package:e_commerce_app/helper_classes/my_text_styles.dart';
import 'package:e_commerce_app/models/config_models/data_model_class.dart';
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
    setState(() {});
    holdScreen();
  }

  holdScreen() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/second');
    });
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
