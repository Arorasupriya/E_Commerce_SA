import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_commerce_app/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:e_commerce_app/constants/color_constants.dart';
import 'package:e_commerce_app/helper_classes/custom_widget.dart';
import 'package:e_commerce_app/helper_classes/my_text_styles.dart';
import 'package:e_commerce_app/models/onboarding_model/signin.dart';
import 'package:e_commerce_app/screens/clipper/custom_clipper.dart';
import 'package:e_commerce_app/screens/dashboard_screens/dashboard_home.dart';
import 'package:e_commerce_app/screens/onbording_screens/signup_screen.dart';
import 'package:e_commerce_app/sharedpreference/sharedpreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  var formKey = GlobalKey<FormState>();
  var txtEmailController = TextEditingController();
  var txtPasswordController = TextEditingController();

  late AnimationController animationControllerFromRight;
  late Animation<Offset> offsetAnimation;

  late AnimationController offsetAnimationControllerFromLeft;
  late Animation<Offset> offsetAnimationFromLeft;

  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    createOffSetAnimationFromLeft();
    createOffSetAnimationFromRight();
  }

  @override
  void dispose() {
    animationControllerFromRight.dispose();
    offsetAnimationControllerFromLeft.dispose();
    super.dispose();
  }

  void createOffSetAnimationFromRight() {
    animationControllerFromRight = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    offsetAnimation =
        Tween<Offset>(begin: const Offset(1.5, 0.0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: animationControllerFromRight,
                curve: Curves.elasticInOut)); //const Interval(0.5, 1.0)
    animationControllerFromRight.forward(from: 0.0);
  }

  void createOffSetAnimationFromLeft() {
    offsetAnimationControllerFromLeft = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    offsetAnimationFromLeft =
        Tween<Offset>(begin: const Offset(-2.0, 0.0), end: Offset.zero).animate(
      CurvedAnimation(
          parent: offsetAnimationControllerFromLeft,
          curve: Curves.elasticInOut),
    );
    offsetAnimationControllerFromLeft.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstants.gradientLightColor,
        body: SingleChildScrollView(
          child: Stack(children: [
            ClipPath(
              clipper: LoginPageClipper(),
              child: Container(
                height: deviceHeight * 0.30,
                width: deviceWidth,
                color: ColorsConstants.gradientDarkColor,
              ),
            ),
            Positioned(
              top: deviceHeight * 0.13,
              left: deviceWidth * 0.35,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText("Sign In",
                      textStyle: mTextStyle25(mWeight: FontWeight.bold),
                      speed: Duration(milliseconds: 500),
                      colors: [
                        Colors.black,
                        ColorsConstants.gradientLightColor,
                      ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    hSpacer(mHeight: 250),
                    //hSpacer(mHeight: 10),
                    SlideTransition(
                      position: offsetAnimationFromLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                          style: mTextStyle12(),
                          controller: txtEmailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: myDecoration(
                            mHintText: "Email Address",
                            mLabelText: "Enter Your Email",
                            bRadius: 12,
                          ),
                        ),
                      ),
                    ),
                    // hSpacer(mHeight: 20),
                    SlideTransition(
                      position: offsetAnimation,
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            } else if (value.isNotEmpty) {
                              if (value.length < 8) {
                                return "Must be at least 8 characters";
                              }
                            }
                            return null;
                          },
                          controller: txtPasswordController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          obscureText: isPasswordVisible,
                          obscuringCharacter: "*",
                          decoration: myDecoration(
                              mHintText: "Password",
                              mLabelText: "Password",
                              bRadius: 12,
                              surFixIconName: isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              mySuffixIconColor: Colors.black.withOpacity(0.7),
                              onSurFixIconTap: () {
                                isPasswordVisible = !isPasswordVisible;
                                setState(() {});
                              }),
                        ),
                      ),
                    ),
                    hSpacer(mHeight: 50),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsConstants.gradientDarkColor,
                            elevation: 2.5,
                            fixedSize: const Size(150, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11))),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            var email = txtEmailController.text.toString();
                            var password =
                                txtPasswordController.text.toString();
                            BlocProvider.of<OnboardingBloc>(context).add(
                                CallSignInAPI(
                                    signInModel: SignInModel(
                                        email: email, password: password)));
                            print("Login successfully");

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DashboardScreen()));
                            txtEmailController.clear();
                            txtPasswordController.clear();
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: mTextStyle16(),
                        )),
                    hSpacer(mHeight: 30),
                    InkWell(
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.transparent;
                        }
                      }),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: "Don't have an account?",
                              style: mTextStyle16(),
                              children: const [
                                TextSpan(
                                    text: " Sign up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
