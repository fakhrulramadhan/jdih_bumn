import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/profile/widget/faq_widget.dart';
import 'package:jdih_bumn/presentation/profile/widget/struktur_jdih_widget.dart';
import 'package:jdih_bumn/presentation/profile/widget/tentang_jdih_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    //h100
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              actions: const [],
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/appbar-bg2.png'),
                        fit: BoxFit.fill)),
                child: const Center(
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      "Tentang JDIH",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff00ADAD),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Struktur JDIH",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff00ADAD),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "FAQ",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff00ADAD),
                      ),
                    ),
                  )
                ],
                // indicator: BoxDecoration(
                //   //borderRadius: BorderRadius.circular(50), // Creates border
                //   color: Color(0xff00ADAD),
                // ),
              ),
            ),
            body: const TabBarView(children: [
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height,
              //   color: Colors.white,
              //   child: const Center(
              //     child: Text(
              //       "Index 0",
              //       style: TextStyle(
              //         fontSize: 14.0,
              //       ),
              //     ),
              //   ),
              // ),
              TentangJdihWidget(),
              StrukturJdihWidget(),
              FaqWidget(),
            ])));
  }
}
