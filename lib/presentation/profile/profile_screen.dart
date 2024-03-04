import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        child: SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              SystemNavigator.pop();

              return false;
            },
            child: Scaffold(
                appBar: PreferredSize(
                  //buat atur tinggi appbar
                  preferredSize: const Size.fromHeight(150.0),
                  child: AppBar(
                    actions: const [],
                    flexibleSpace: SizedBox(
                      height: 100,
                      width: width,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40)),
                                child: Image.asset(
                                  "assets/images/appbar-bg2.png",
                                  width: width,
                                  height: 100.0,
                                  fit: BoxFit.none,
                                ),
                              ),
                              SizedBox(
                                height: 90,
                                width: width,
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
                            ],
                          ),
                        ],
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
                ])),
          ),
        ));
  }
}
