// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/artikel/artikel_screen.dart';
import 'package:jdih_bumn/presentation/berita/berita_screen.dart';
import 'package:jdih_bumn/presentation/berita_detail/berita_detail_screen.dart';
import 'package:jdih_bumn/presentation/infografis/infografis_screen.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/kamus_hukum_screen.dart';
import 'package:jdih_bumn/presentation/main_menu/widgets/berita_dan_info_widget.dart';
import 'package:jdih_bumn/presentation/main_menu/widgets/disclaimer_stack_widget.dart';
import 'package:jdih_bumn/presentation/main_menu/widgets/infografis_widget_new.dart';
import 'package:jdih_bumn/presentation/main_menu/widgets/list_menu_peraturan_bumn_widget.dart';
import 'package:jdih_bumn/presentation/main_menu/widgets/list_menu_widget.dart';
import 'package:jdih_bumn/presentation/monografi/monografi_screen.dart';
import 'package:jdih_bumn/presentation/putusan/putusan_screen.dart';
import 'package:jdih_bumn/presentation/survei/survei_screen.dart';
import '../peraturan/peraturan_screen.dart';
import '../peraturan_bumn/peraturan_bumn.dart';
import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      //appBar: ,
      body: DynMouseScroll(
        builder: (context, controller, physics) => ListView(
          controller: controller,
          physics: physics,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            SafeArea(
              child: SizedBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 220,
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
                                height: 160.0,
                                fit: BoxFit.none,
                              ),
                            ),
                            SizedBox(
                              height: 220,
                              width: width,
                              //color: Colors.green,
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 50.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.asset(
                                          "assets/images/Logo JDIH.png",
                                          width: 20,
                                          height: 50,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                          width: 0.4 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width),
                                      SizedBox(
                                        height: 50,
                                        width: 130,
                                        child: Image.asset(
                                          "assets/images/Logo JDIH BUMN.png",
                                          width: 24.0,
                                          height: 44.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 45.0,
                                  ),
                                  //kotak pencarian di hide dulu k-bumn
                                  // Center(
                                  //   child: SizedBox(
                                  //     width: width * 0.9,
                                  //     height: 50,
                                  //     child: Stack(
                                  //       children: [
                                  //         Container(
                                  //           width: width * 0.9,
                                  //           height: 50,
                                  //           decoration: BoxDecoration(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(12),
                                  //             color: const Color.fromARGB(
                                  //                 255, 162, 213, 255),
                                  //           ),
                                  //         ),
                                  //         Center(
                                  //           child: SizedBox(
                                  //             height: 40,
                                  //             width: width * 0.8,
                                  //             child: Material(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(10),
                                  //               elevation: 3,
                                  //               child: TextFormField(
                                  //                 controller: searchController,
                                  //                 onFieldSubmitted: (value) {},
                                  //                 decoration: InputDecoration(
                                  //                     suffixIcon: InkWell(
                                  //                       onTap: () {},
                                  //                       child: const Padding(
                                  //                         padding:
                                  //                             EdgeInsets.only(
                                  //                                 left: 6),
                                  //                         child: Icon(
                                  //                           Icons.search,
                                  //                           size: 24.0,
                                  //                           color: Colors.black,
                                  //                         ),
                                  //                       ),
                                  //                     ),
                                  //                     filled: true,
                                  //                     fillColor: Colors.white,
                                  //                     contentPadding:
                                  //                         const EdgeInsets.only(
                                  //                             top: 10),
                                  //                     border:
                                  //                         const OutlineInputBorder(
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .all(
                                  //                               Radius.circular(
                                  //                                   7),
                                  //                             ),
                                  //                             borderSide:
                                  //                                 BorderSide
                                  //                                     .none),
                                  //                     enabledBorder: const OutlineInputBorder(
                                  //                         borderRadius:
                                  //                             BorderRadius
                                  //                                 .all(Radius
                                  //                                     .circular(
                                  //                                         10)),
                                  //                         borderSide:
                                  //                             BorderSide(
                                  //                                 color: Colors
                                  //                                     .black38,
                                  //                                 width: 1)),
                                  //                     hintText:
                                  //                         '  Ketik kata kunci pencarian....',
                                  //                     hintStyle:
                                  //                         const TextStyle(
                                  //                       fontWeight:
                                  //                           FontWeight.w400,
                                  //                       fontSize: 14.0,
                                  //                     )),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListMenuWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const PeraturanScreen();
                              }),
                            );
                          },
                          assetUrl: "assets/images/Peraturan.svg",
                          menuText: "Peraturan",
                        ),
                        ListMenuPeraturanBumnWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PerarturanBumnScreen()),
                              );
                            },
                            menuText: "Peraturan \n  BUMN"),
                        //gbr iconnya enggak muncul
                        // ListMenuWidget(
                        //     onTap: () {},
                        //     assetUrl: "assets/images/Peraturan BUMN.svg",
                        //     menuText: "Peraturan BUMN"),
                        ListMenuWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PutusanScreen()),
                              );
                            },
                            assetUrl: "assets/images/Putusan.svg",
                            menuText: "Putusan"),
                        ListMenuWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MonografiScreen()),
                              );
                            },
                            assetUrl: "assets/images/monografis.svg",
                            menuText: "Monografi")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  //berita di home page
                  //ambil gbrnya yang api full nya aja
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListMenuWidget(
                          onTap: () {
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         title: const Text('Warning'),
                            //         content: const Text('Coming Soon'),
                            //         actions: <Widget>[
                            //           ElevatedButton(
                            //             style: ElevatedButton.styleFrom(
                            //               backgroundColor: Colors.blue,
                            //             ),
                            //             onPressed: () {
                            //               Navigator.pop(context);
                            //             },
                            //             child: const Text(
                            //               "OK",
                            //               style: TextStyle(
                            //                 color: Colors.white,
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       );
                            //     });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BeritaScreen()),
                            );
                          },
                          assetUrl: "assets/images/Berita.svg",
                          menuText: "Berita",
                        ),
                        ListMenuWidget(
                            onTap: () {
                              // showDialog(
                              //     context: context,
                              //     builder: (context) {
                              //       return AlertDialog(
                              //         title: const Text('Warning'),
                              //         content: const Text(
                              //             'Coming Soon'),
                              //         actions: <Widget>[
                              //           ElevatedButton(
                              //             style: ElevatedButton.styleFrom(
                              //               backgroundColor: Colors.blue,
                              //             ),
                              //             onPressed: () {
                              //               Navigator.pop(context);
                              //             },
                              //             child: const Text(
                              //               "OK",
                              //               style: TextStyle(
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           ),
                              //         ],
                              //       );
                              //     });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ArtikelScreen()),
                              );
                            },
                            assetUrl: "assets/images/Artikel.svg",
                            menuText: "Artikel"),
                        ListMenuWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const KamusHukumScreen()),
                              );
                            },
                            assetUrl: "assets/images/Kamus Hukum.svg",
                            menuText: "Kamus \nHukum"),
                        ListMenuWidget(
                            onTap: () {
                              // showDialog(
                              //     context: context,
                              //     builder: (context) {
                              //       return AlertDialog(
                              //         title: const Text('Warning'),
                              //         content: const Text(
                              //             'Coming Soon'),
                              //         actions: <Widget>[
                              //           ElevatedButton(
                              //             style: ElevatedButton.styleFrom(
                              //               backgroundColor: Colors.blue,
                              //             ),
                              //             onPressed: () {
                              //               Navigator.pop(context);
                              //             },
                              //             child: const Text(
                              //               "OK",
                              //               style: TextStyle(
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           ),
                              //         ],
                              //       );
                              //     });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SurveiScreen()),
                              );
                            },
                            assetUrl: "assets/images/Survei.svg",
                            menuText: "Survei")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Infografis",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  // Container(
                  //   height: 400,
                  //   width: 80,
                  //   color: Colors.purple,
                  // )
                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        controller: controller,
                        physics: physics,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [InfoGrafisWidgetNew()],
                        ),
                      )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Berita dan Info",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  BeritaDanInfoWidget(
                    title: "Seminar Merger Dan Akuisisi BUMN",
                    waktu: "Jakarta, 30 November 2023",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BeritaDetailScreen()),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const DisclaimerStackWidget(),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
