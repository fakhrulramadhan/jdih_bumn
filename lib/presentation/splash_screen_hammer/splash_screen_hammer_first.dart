// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SplashScreenHammerFirst extends StatefulWidget {
  const SplashScreenHammerFirst({Key? key}) : super(key: key);

  @override
  State<SplashScreenHammerFirst> createState() =>
      _SplashScreenHammerFirstState();
}

class _SplashScreenHammerFirstState extends State<SplashScreenHammerFirst> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
