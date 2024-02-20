import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PengelolaanWidget extends StatefulWidget {
  const PengelolaanWidget({super.key});

  @override
  State<PengelolaanWidget> createState() => _OrgansisasiWidgetState();
}

class _OrgansisasiWidgetState extends State<PengelolaanWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Struktur Pengelolaan JDIH Kementerian BUMN",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          // width: 340,
          //height: 431,
          const SizedBox(
            height: 25.0,
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 344,
                      height: 431,
                      child: SvgPicture.asset(
                        "assets/images/pengelolaans.svg",
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
          ),
        ],
      ),
    );
  }
}
