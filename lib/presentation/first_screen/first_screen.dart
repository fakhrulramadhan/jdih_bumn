import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/images/bumn.jpg"),
      backgroundColor: Colors.white,
      showLoader: false,
      //navigator: const SecondScreen(),
      durationInSeconds: 4,
    );
  }
}
