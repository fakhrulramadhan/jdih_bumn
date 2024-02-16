// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './unordered_list_widget.dart';

class TentangJdihWidget extends StatefulWidget {
  const TentangJdihWidget({Key? key}) : super(key: key);

  @override
  State<TentangJdihWidget> createState() => _TentangJdihWidgetState();
}

class _TentangJdihWidgetState extends State<TentangJdihWidget> {
  //late ScrollController _scrollController;

  @override
  void initState() {
    // _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              height: 1185,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tentang JDIH",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text(
                    "JDIH Kementerian BUMN adalah wadah pendayagunaan bersama atas dokumen hukum terkait Kementerian BUMN, BUMN, dan dokumen hukum lainnya yang dikelola secara tertib, terpadu, dan berkesinambungan, serta merupakan sarana pemberian pelayanan informasi hukum secara lengkap, akurat, mudah, dan cepat.",
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Container(
                    height: 1000,
                    width: 344,
                    color: Colors.yellow,
                    child: Stack(
                      children: [
                        Container(
                          height: 1000,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                12.0,
                              ),
                            ),
                            // image: DecorationImage(
                            //     image: AssetImage(
                            //         'assets/images/appbar-bg2.png'),
                            //     fit: BoxFit.cover)
                          ),
                          child: Image.asset(
                            "assets/images/appbar-bg2.png",
                            // width: MediaQuery.of(context).size.width,
                            // height: 1000,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 822,
                          width: 344,
                          //color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  "VISI",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                const Text(
                                  "Menjadikan JDIH Kementerian BUMN sebagai penyedia dokumentasi dan informasi hukum yang lengkap, akurat, dan terintegrasi, serta dapat diakses secara cepat dan mudah.",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                  "MISI",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                // UnorderedListItem(
                                //     "Menjamin terciptanya pengelolaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN yang terpadu dan terintegrasi")
                                // UnorderedListWidget([
                                //   "Menjamin terciptanya pengelolaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN yang terpadu dan terintegrasi",
                                //   "Menjamin ketersediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN yang lengkap dan akurat, serta dapat diakses secara cepat dan mudah",
                                //   "Mengembangkan kerja sama yang efektif antara Pusat JDIH dan Anggota JDIH serta antar sesama Anggota JDIH dalam rangka penyediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN",
                                //   "Mengembangkan kerja sama yang efektif antara Pusat JDIH dan Anggota JDIH serta antar sesama Anggota JDIH dalam rangka penyediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN"
                                // ]
                                // )

                                const UnorderedListItem(
                                    "Menjamin terciptanya pengelolaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN yang terpadu dan terintegrasi"),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const UnorderedListItem(
                                    "Menjamin ketersediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN yang lengkap dan akurat, serta dapat diakses secara cepat dan mudah"
                                    "Menjamin ketersediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN yang lengkap dan akurat, serta dapat diakses secara cepat dan mudah"),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const UnorderedListItem(
                                    "Mengembangkan kerja sama yang efektif antara Pusat JDIH dan Anggota JDIH serta antar sesama Anggota JDIH dalam rangka penyediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN"),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const UnorderedListItem(
                                    "Mengembangkan kerja sama yang efektif antara Pusat JDIH dan Anggota JDIH serta antar sesama Anggota JDIH dalam rangka penyediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN"),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: SvgPicture.asset(
                                    "assets/images/BUMN Background.svg",
                                    height: 153,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
