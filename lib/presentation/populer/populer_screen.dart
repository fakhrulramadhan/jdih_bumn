import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jdih_bumn/presentation/populer/widget/populer_widget.dart';

class PopulerScreen extends StatefulWidget {
  // harus bikin reusable widget dulu, sama kayak yang di main_menu
  // final String judul;
  // final String nosk;
  // final String isi;
  const PopulerScreen({super.key});

  @override
  State<PopulerScreen> createState() => _PopulerScreenState();
}

class _PopulerScreenState extends State<PopulerScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      controller: ScrollController(),
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
                            "Populer",
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
            PopulerWidget(),
            // const PopulerWidget(
            //   judul: "SEMENBUMN",
            //   nosk: "SK-8/DKU.MBU/12/2023",
            //   isi:
            //       "Nilai-nilai Utama (Core Values) Sumber Daya Manusia Badan Usaha Milik Negara",
            //   tgl_publikasi: "06-12-2023",
            //   jml_dilihat: "2.731 K",
            // ),
            // const PopulerWidget(
            //   judul: "Undang - Undang",
            //   nosk: "UU Nomor 31 Tahun 1999",
            //   isi: "Pemberantasan Tindak Pidana Korupsi",
            //   tgl_publikasi: "06-12-2023",
            //   jml_dilihat: "2.731 K",
            // ),
            const SizedBox(
              height: 20.0,
            ),
            SvgPicture.asset(
              "assets/images/BUMN Background.svg",
              height: 153,
              width: 332,
            )
          ],
        ),
      )),
    );
  }
}
