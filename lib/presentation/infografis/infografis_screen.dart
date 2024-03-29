import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jdih_bumn/constants/constants.dart';
import 'package:dots_indicator/dots_indicator.dart';

class InfografisScreen extends StatefulWidget {
  const InfografisScreen({super.key});

  @override
  State<InfografisScreen> createState() => _InfografisScreenState();
}

class _InfografisScreenState extends State<InfografisScreen> {
  //untuk geser slider secara manual (pakai tombol)
  final CarouselController controller1 = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        //color: Colors.red,
        height: height,
        child: Column(
          children: [
            Container(
              height: 0.95 * height,
              width: width,
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: 377,
                        height: 600.0,
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          child: Image.asset(
                            "assets/images/appbar-bg2.png",
                            width: 377,
                            height: 400.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 90,
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 20.0,
                                ),
                                BackButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                SizedBox(
                                  width:
                                      0.195 * MediaQuery.of(context).size.width,
                                ),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Infografis",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          const Center(
                            child: Text(
                              "Prinsip Tata Kelola Perusahaan yang \n Baik BUMN",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  overflow: TextOverflow.visible),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          CarouselSlider(
                            carouselController: controller1,
                            items: Constants.sliderImages.map((i) {
                              return Builder(
                                builder: (BuildContext context) => Image.asset(
                                  i,
                                  fit: BoxFit.contain,
                                  height: 300,
                                  width: 280,
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              autoPlay: false,
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,
                              aspectRatio: 2.0,
                              height: 300,
                              initialPage: 0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DotsIndicator(
                            dotsCount: Constants.sliderImages.length,
                            position: currentIndex,
                          )
                        ],
                      ),
                      Positioned(
                        right: 20,
                        top: 270,
                        child: InkWell(
                          onTap: () => controller1.animateToPage(1,
                              duration: const Duration(milliseconds: 500)),
                          child: Container(
                            width: 60,
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 224, 240, 255),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_right,
                                size: 36.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        top: 270,
                        child: InkWell(
                          onTap: () => controller1.animateToPage(0,
                              duration: const Duration(milliseconds: 500)),
                          child: Container(
                            width: 60,
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 224, 240, 255),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_left,
                                size: 36.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   height: 102,
                  //   width: 300,
                  //   color: Colors.brown,
                  // )
                  Container(
                    height: 118,
                    width: width,
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SvgPicture.asset(
                        "assets/images/BUMN Background.svg",
                        //height: 118,
                        // width: width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
