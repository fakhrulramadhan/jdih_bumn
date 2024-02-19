import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StrukturJdihWidget extends StatefulWidget {
  const StrukturJdihWidget({super.key});

  @override
  State<StrukturJdihWidget> createState() => _StrukturJdihWidgetState();
}

class _StrukturJdihWidgetState extends State<StrukturJdihWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
        child: Scaffold(
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              height: 550,
              width: width,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
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
            ),
          ),
        ),
        onWillPop: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Maaf, tidak bisa ke halaman sebelumnya'),
              backgroundColor: Colors.red,
            ),
          );
          return false;
        });
  }
}
