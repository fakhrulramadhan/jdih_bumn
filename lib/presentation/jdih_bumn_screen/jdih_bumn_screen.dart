// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class JdihBumnScreen extends StatefulWidget {
  const JdihBumnScreen({Key? key}) : super(key: key);

  @override
  State<JdihBumnScreen> createState() => _JdihBumnScreenState();
}

class _JdihBumnScreenState extends State<JdihBumnScreen> {
  // dijalankan pertama kali, setelah 3 detik ke dashboard screen
  @override
  void initState() {
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const MainMenuScreen()),
    //   );
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Dashboard"),
      //   actions: const [],
      // ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/jdih_bumn.png",
                    width: 250,
                    height: 110.0,
                    fit: BoxFit.contain,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.white,
        child: Center(
          child: Text(
            "Versi 2.0",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
