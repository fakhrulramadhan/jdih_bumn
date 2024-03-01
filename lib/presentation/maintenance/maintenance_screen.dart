import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/home_screen/home_screen.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Dashboard"),
      //   actions: const [],
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  "Proses Pembaruan \nHalaman Aplikasi",
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1F2855)),
                ),
                const SizedBox(
                  height: 46.0,
                ),
                Image.asset(
                  "assets/images/maintenance.png",
                  width: 303.0,
                  height: 120.0,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                const Text(
                  "Mohon maaf atas ketidaknyamanan ini. Kami sedang melakukan pembaruan pada halaman aplikasi untuk memberikan pengalaman terbaik bagi pengguna.",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1F2855),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 1,
                  offset: const Offset(0, -10),
                  blurRadius: 1)
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: Center(
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff0093AD),
              ),
              child: const Center(
                  child: Text(
                "Kembali Ke Beranda",
                style: TextStyle(color: Colors.white, fontSize: 12),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
