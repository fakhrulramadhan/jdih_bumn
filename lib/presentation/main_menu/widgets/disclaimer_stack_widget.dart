import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DisclaimerStackWidget extends StatefulWidget {
  const DisclaimerStackWidget({super.key});

  @override
  State<DisclaimerStackWidget> createState() => _DisclaimerStackWidgetState();
}

class _DisclaimerStackWidgetState extends State<DisclaimerStackWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 200,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 9, 85),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 200,
            padding: const EdgeInsets.only(left: 20, top: 10),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12)),
            child: const Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "DISCLAIMER",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                //RichText(text: "ss")
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Semua yang disajikan dalam website JDIH Kementerian BUMN dimaksudkan sebagaiinformasi yang dikeluarkan oleh KementerianBUMN. Apabila  terdapat kekeliruan atauperbedaan antara informasi yang disajikandalam website ini dengan dokumen resmi di Kementerian BUMN, maka yang berlaku adalah dokumen resmi pada  Kementerian BUMN.",
                //     style: TextStyle(
                //         fontSize: 10.0,
                //         color: Colors.white,
                //         fontWeight: FontWeight.w200),
                //   ),
                // ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Semua yang disajikan dalam website JDIH \nKementerian BUMN dimaksudkan sebagai \ninformasi yang dikeluarkan oleh \nKementerian BUMN. Apabila terdapat\nkekeliruan atau perbedaan antara informasi\nyang disajikan dalam website ini dengan dokumen resmi di Kementerian BUMN, maka yang berlaku adalah dokumen resmi pada  Kementerian BUMN.",
                    style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 126,
              child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  "assets/images/Disclaimer.svg",
                  alignment: Alignment.topRight,
                  height: 110,
                  width: 131,
                ),
              )),
        )
      ],
    );
  }
}
