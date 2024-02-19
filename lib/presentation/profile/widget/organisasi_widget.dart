import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrgansisasiWidget extends StatefulWidget {
  const OrgansisasiWidget({super.key});

  @override
  State<OrgansisasiWidget> createState() => _OrgansisasiWidgetState();
}

class _OrgansisasiWidgetState extends State<OrgansisasiWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Struktur Organisiasi JDIH Kementerian BUMN",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          SizedBox(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 344,
                    height: 210,
                    child: Image.asset(
                      "assets/images/struktur_jdih_final.png",
                      width: 340,
                      height: 205,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 37.0,
                ),
                SvgPicture.asset(
                  "assets/images/BUMN Background.svg",
                  height: 153,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
