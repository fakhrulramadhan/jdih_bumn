// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/main_menu/main_menu_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jdih_bumn/presentation/populer/populer_screen.dart';
import 'package:jdih_bumn/presentation/profile/profile_screen.dart';
import 'package:jdih_bumn/presentation/terbaru/terbaru_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  //halaman yang mau ditampilin di body bottom bar taruh disini
  final List<Widget> pages = [
    const MainMenuScreen(),
    const TerbaruScreen(),
    const PopulerScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
          //selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? SizedBox(
                      height: 44,
                      width: 24,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/images/Home On.svg",
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Text(
                            "Home",
                            style: TextStyle(
                              fontSize: 8.0,
                            ),
                          ),
                        ],
                      ))
                  : const SizedBox(
                      height: 44,
                      width: 24,
                      child: Column(
                        children: [
                          Icon(
                            Icons.home,
                            size: 24.0,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              fontSize: 8.0,
                            ),
                          ),
                        ],
                      )),
              // SizedBox(
              //     height: 44,
              //     width: 24,
              //     child: Column(
              //       children: [
              //         SvgPicture.asset(
              //           "assets/images/Home off.svg",
              //           fit: BoxFit.fill,
              //         ),
              //         const SizedBox(
              //           height: 5.0,
              //         ),
              //         const Text(
              //           "Home",
              //           style: TextStyle(
              //             fontSize: 8.0,
              //           ),
              //         ),
              //       ],
              //     )),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: selectedIndex == 1
                    ? SizedBox(
                        height: 44,
                        width: 24,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/Terbaru On.svg",
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            const Text(
                              "Baru",
                              style: TextStyle(
                                fontSize: 8.0,
                              ),
                            ),
                          ],
                        ))
                    : SizedBox(
                        height: 44,
                        width: 24,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/terbaru off.svg",
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            const Text(
                              "Baru",
                              style: TextStyle(
                                fontSize: 8.0,
                              ),
                            ),
                          ],
                        )),
                label: 'Terbaru'),
            BottomNavigationBarItem(
                icon: selectedIndex == 2
                    ? SizedBox(
                        height: 44,
                        width: 35,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/populer on.svg",
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            const Text(
                              "Populer",
                              style: TextStyle(
                                fontSize: 8.0,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ))
                    : SizedBox(
                        height: 44,
                        width: 35,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/Populer Off.svg",
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            const Text(
                              "Populer",
                              style: TextStyle(
                                fontSize: 8.0,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        )),
                label: 'Populer'),
            BottomNavigationBarItem(
                icon: selectedIndex ==
                        3 //selectedindexnya samadengan index ke berapa
                    ? SizedBox(
                        height: 44,
                        width: 35,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/profile on.svg",
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            const Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 8.0,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ))
                    : SizedBox(
                        height: 44,
                        width: 35,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/profile off.svg",
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            const Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 8.0,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        )),
                label: 'Profile')
          ]),
    );
  }
}
