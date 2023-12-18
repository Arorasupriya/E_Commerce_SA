import 'dart:io';
import 'package:e_commerce_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:e_commerce_app/screens/onbording_screens/signup_screen.dart';
import 'package:e_commerce_app/screens/onbording_screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => CartBloc()),
    BlocProvider(create: (context) => OnboardingBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ECommerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplachScreen(),

      // home: const BottomAppBarScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
