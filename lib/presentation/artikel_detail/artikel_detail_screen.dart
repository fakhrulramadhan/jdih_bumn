import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/artikel_detail/widget/info_detail_artikel_widget.dart';
import 'package:jdih_bumn/presentation/artikel_detail/widget/info_detail_judul_artikel_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/bagikan_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/download_button_widget.dart';
import 'package:share_plus/share_plus.dart';

class ArtikelDetailScreen extends StatefulWidget {
  const ArtikelDetailScreen({super.key});

  @override
  State<ArtikelDetailScreen> createState() => _ArtikelDetailScreenState();
}

class _ArtikelDetailScreenState extends State<ArtikelDetailScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          title: const Text("Artikel"),
          centerTitle: true,
          actions: const [],
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 817,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(25),
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                          image: DecorationImage(
                              image: AssetImage('assets/images/appbar-bg2.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/appbar-bg2.png'),
                            fit: BoxFit.cover)),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 40.0,
                        ),
                        // Text(
                        //   "91/PUU-XVIII/2020",
                        //   style: TextStyle(
                        //     fontSize: 24.0,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Pertanggungjawaban Direksi BUMN atas Kerugian yang Dialami Negara dalam Penerapan Prinsip Business Judgement Rule",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 2050,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 20),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 210.0,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Detail Peraturan",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: Container(
                          //     height: 20,
                          //     width: 20,
                          //     color: Colors.red, \n = enter
                          //   ),
                          // )
                          InfoDetailArtikelWidget(
                            partOf: "Jenis Artikel",
                            title: "Artikel Hukum",
                          ),
                          InfoDetailJudulArtikelWidget(
                            partOf: "Judul",
                            title:
                                "Pertanggungjawaban Direksi BUMN atas Kerugian yang Dialami Negara dalam Penerapan Prinsip Business Judgement Rule",
                          ),
                          InfoDetailArtikelWidget(
                              partOf: "T.E.U Badan/\nPengarang",
                              title: "Amiliya Handayan"),
                          InfoDetailArtikelWidget(
                              partOf: "Tempat Terbit", title: "JAKARTA"),
                          InfoDetailArtikelWidget(
                              partOf: "Tahun", title: "2022"),
                          InfoDetailArtikelWidget(partOf: "Subjek", title: "-"),
                          InfoDetailArtikelWidget(
                              partOf: "Bahasa", title: "Indonesia"),
                          InfoDetailArtikelWidget(
                              partOf: "Bidang Hukum", title: "Hukum Umum"),
                          InfoDetailArtikelWidget(
                              partOf: "Sumber", title: "2022; 14"),
                          InfoDetailArtikelWidget(
                              partOf: "Lokasi",
                              title:
                                  "Asisten Deputi Bidang Peraturan\nPerundang-undangan"),
                          InfoDetailArtikelWidget(
                              partOf: "Lampiran", title: "-")
                        ],
                      ))
                ],
              ),
            ),
            // const Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     "Detail Peraturan",
            //     style: TextStyle(
            //       fontSize: 12.0,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            // const InfoDetailWidget(title: "Tipe Dokumen", subtitle: "Putusan"),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 1,
                  offset: Offset(0, -10),
                  blurRadius: 1),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BagikanButtonWidget(
              onPressed: () async {
                const urlLink = "https://www.youtube.com/watch?v=CNUBhb_cM6E";

                await Share.share("This cat is cute $urlLink");
              },
            ),
            const DownloadButtonWidget()
          ],
        ),
      ),
    );
  }
}
