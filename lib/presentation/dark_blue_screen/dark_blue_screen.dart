// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class DarkBlueScreen extends StatefulWidget {
  const DarkBlueScreen({Key? key}) : super(key: key);

  @override
  State<DarkBlueScreen> createState() => _DarkBlueScreenState();
}

class _DarkBlueScreenState extends State<DarkBlueScreen> {
  // setelah 1/2 detik, langsung ke halaman jdinbumn
  @override
  void initState() {
    // Timer(const Duration(milliseconds: 1500), () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const JdihBumnScreen()),
    //   );
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(49, 1, 41, 184),
      // appBar: PreferredSize(
      //     preferredSize: const Size.fromHeight(70),
      //     child: AppBar(
      //       flexibleSpace: const Image(
      //         image: AssetImage("assets/images/appbar-bg.png"),
      //         fit: BoxFit.cover,
      //       ),
      //       backgroundColor: Colors.transparent,
      //       actions: const [],
      //       leading: SizedBox(
      //         height: 24,
      //         width: 24,
      //         child: Image.asset(
      //           "assets/images/Logo JDIH.png",
      //           width: 24,
      //           height: 24,
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            color: const Color.fromARGB(1, 124, 84, 50),
          )
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.transparent,
        child: Center(
          child: Text(
            "Versi 2.0",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
