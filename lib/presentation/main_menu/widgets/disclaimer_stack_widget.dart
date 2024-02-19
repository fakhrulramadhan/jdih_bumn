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
            height: 430,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                    blurRadius: 2)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                "assets/images/appbar-bg2.png",
                width: MediaQuery.of(context).size.width * 0.95,
                height: 195.0,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 430,
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                Text(
                  "DISCLAIMER",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SvgPicture.asset(
                  "assets/images/Disclaimer.svg",
                  alignment: Alignment.center,
                  height: 189,
                  width: 159,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Semua yang disajikan dalam website JDIH \nKementerian BUMN dimaksudkan sebagai \ninformasi yang dikeluarkan oleh \nKementerian BUMN. Apabila terdapat\nkekeliruan atau perbedaan antara informasi\nyang disajikan dalam website ini dengan dokumen resmi di Kementerian BUMN, maka yang berlaku adalah dokumen resmi pada  Kementerian BUMN.",
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
