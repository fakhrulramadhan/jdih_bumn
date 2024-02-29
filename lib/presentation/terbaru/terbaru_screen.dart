import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jdih_bumn/presentation/home_screen/home_screen.dart';
import 'package:jdih_bumn/presentation/terbaru/widget/berita_terbaru_widget.dart';

class TerbaruScreen extends StatefulWidget {
  // harus bikin reusable widget dulu, sama kayak yang di main_menu
  // final String judul;
  // final String nosk;
  // final String isi;
  const TerbaruScreen({super.key});

  @override
  State<TerbaruScreen> createState() => _TerbaruScreenState();
}

class _TerbaruScreenState extends State<TerbaruScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );

        return false;
      },
      child: SingleChildScrollView(
        controller: ScrollController(),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: SizedBox(
          child: Column(
            children: [
              SizedBox(
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
                              "Terbaru",
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
              const SizedBox(
                height: 28.0,
              ),
              const BeritaTerbaruWidget(),
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                "assets/images/BUMN Background.svg",
                height: 153,
                width: 332,
              )
            ],
          ),
        )),
      ),
    );
  }
}
