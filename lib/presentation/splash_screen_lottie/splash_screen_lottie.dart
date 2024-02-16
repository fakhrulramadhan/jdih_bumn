import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/home_screen/home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScrenLottie extends StatefulWidget {
  const SplashScrenLottie({super.key});

  @override
  State<SplashScrenLottie> createState() => _SplashScrenLottieState();
}

class _SplashScrenLottieState extends State<SplashScrenLottie> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 4800), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Load a Lottie file from your assets

          //https://isotropic.co/tool/video-to-lottie/
          Lottie.asset(
            'assets/json/splash_screen.mp4.lottie.json',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: BottomAppBar(
          //color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Container(
            color: Colors.transparent,
            child: const Center(
              child: Text(
                "Version 2.0",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
