import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:jdih_bumn/data/model/response/stage/infografis_response_model.dart';

class InfografisScreen extends StatefulWidget {
  final Item infografis;
  const InfografisScreen({super.key, required this.infografis});

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          child: Image.asset(
                            "assets/images/appbar-bg2.png",
                            width: 350,
                            height: 400.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 70,
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
                          // const SizedBox(
                          //   height: 2.0,
                          // ),
                          Center(
                            child: Container(
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                "${widget.infografis.judul}",
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    overflow: TextOverflow.fade),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          //Constants.sliderImages.map
                          CarouselSlider(
                            carouselController: controller1,
                            items: widget.infografis.details!.map((i) {
                              return Builder(
                                builder: (BuildContext context) => Container(
                                  height: 336,
                                  width: 346,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    clipBehavior: Clip.hardEdge,
                                    // Image.network(
                                    //   "${i.imagePath}",
                                    //   fit: BoxFit.fill,
                                    //   // height: 300,
                                    //   // width: 280,
                                    // ),

                                    child: CachedNetworkImage(
                                      imageUrl: "${i.imagePath}",
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.error,
                                        size: 24.0,
                                      ),
                                      height: 300,
                                      width: 280,
                                    ),
                                  ),
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
                          //dotsCount: Constants.sliderImages.length,
                          // dotsCount:widget.infografis.details!.length,
                          DotsIndicator(
                            dotsCount: widget.infografis.details!.length,
                            position: currentIndex,
                            decorator: DotsDecorator(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              activeColor: Colors.black.withOpacity(0.5),
                              color: Colors.grey.withOpacity(0.5),
                              size: const Size(35, 6),
                              activeSize: const Size(35, 6),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              // sizes: [const Size(40, 6), const Size(40, 6)],

                              // shapes: [
                              //   RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(12)),
                              //   RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(12))
                              // ]
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        right: 20,
                        top: 270,
                        child: InkWell(
                          // onTap: () => controller1.animateToPage(1,
                          //     duration: const Duration(milliseconds: 500)),
                          onTap: () => controller1.nextPage(),
                          child: Container(
                            width: 60,
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 224, 240, 255),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_right,
                                size: 24.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   left: 18,
                      //   top: 270,
                      //   child: InkWell(
                      //     onTap: () => controller1.animateToPage(0,
                      //         duration: const Duration(milliseconds: 500)),
                      //     child: Container(
                      //       width: 60,
                      //       height: 60.0,
                      //       decoration: BoxDecoration(
                      //           color: const Color.fromARGB(255, 224, 240, 255),
                      //           borderRadius: BorderRadius.circular(30)),
                      //       child: const Center(
                      //         child: Icon(
                      //           Icons.arrow_left,
                      //           size: 36.0,
                      //           color: Colors.blue,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
