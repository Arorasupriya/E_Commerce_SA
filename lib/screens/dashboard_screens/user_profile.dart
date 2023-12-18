import 'package:e_commerce_app/screens/onbording_screens/login_screen.dart';
import 'package:e_commerce_app/sharedpreference/sharedpreference.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
          onPressed: () {
            MySharedPreference().setSharedPrefValue(strToken: '');
            setState(() {});
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SignInScreen()));
          },
          child: const Text("SignOut")),
    ));
  }
}
