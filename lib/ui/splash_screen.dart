import 'dart:async';
import 'package:flutter/material.dart';
import 'home/Home_Screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).
      pushReplacementNamed(HomeScreen.routeName);
    });
    return Scaffold(
        body: Image.asset(
          "assets/images/splash.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ));
  }
}
