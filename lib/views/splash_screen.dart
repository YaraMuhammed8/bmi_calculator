import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bmi_calculator/views/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splashTransition: SplashTransition.slideTransition,
        splashIconSize: 3000,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/images/bmi.png",
              fit: BoxFit.cover,
              height: 80,
              width: 80,
            ),
            const Text(
              "BMI Calculator",
              style: TextStyle(
                  color: Color(0xff006672),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo"),
            ),
          ],
        ),
        nextScreen: HomeScreen());
  }
}
