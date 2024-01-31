import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/bagikan_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/download_button_widget.dart';
import 'package:jdih_bumn/presentation/putusan_detail/widget/info_detail_no_margin_widget.dart';
import 'package:share_plus/share_plus.dart';

class PutusanDetailScreen extends StatefulWidget {
  const PutusanDetailScreen({super.key});

  @override
  State<PutusanDetailScreen> createState() => _PutusanDetailScreenState();
}

class _PutusanDetailScreenState extends State<PutusanDetailScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Putusan"),
        centerTitle: true,
        actions: const [],
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        thickness: 10,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 2050,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Stack(
                  children: [
                    Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // image: DecorationImage(
                        //     image: AssetImage('assets/images/appbar-bg2.png'),
                        //     fit: BoxFit.cover)
                      ),
                      child: Image.asset(
                        "assets/images/appbar-bg2.png",
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 10),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 40.0,
                          ),
                          Text(
                            "91/PUU-XVIII/2020",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Mahkamah Konstitusi Pengujian Formil Undang-Undang Nomor 11 Tahun 2020 tentang Cipta Kerja terhadap Undang-Undang Dasar Negara Republik Indonesia Tahun 1945",
                            style: TextStyle(
                              fontSize: 14.0,
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
                              height: 280.0,
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
                            SizedBox(
                              height: 10.0,
                            ),
                            InfoDetailMarginNoWidget(
                                title: "Tipe Dokumen", subtitle: "Putusan"),
                            InfoDetailMarginNoWidget(
                                title: "Judul",
                                heightTitle: 130,
                                subtitle:
                                    "Pengujian Formil Undang-Undang Nomor 11 Tahun 2020 tentang Cipta Kerja terhadap Undang-Undang Dasar Negara Republik Indonesia Tahun 1945"),
                            InfoDetailMarginNoWidget(
                                title: "T.E.U Badan/Pengarang",
                                subtitle: "Mahkamah Konstitusi"),
                            InfoDetailMarginNoWidget(
                                title: "Singkatan Jenis/Bentuk Peraturan",
                                subtitle: "MK"),
                            InfoDetailMarginNoWidget(
                                title: "Bidang Hukum",
                                subtitle: "Putusan Pengadilan"),
                            InfoDetailMarginNoWidget(
                                title: "Sumber",
                                subtitle: "Lembaran Lepas (LL)"),
                            InfoDetailMarginNoWidget(
                                title: "Subjek",
                                subtitle: "UJI FORMIL - UU CIPTAKER"),
                            InfoDetailMarginNoWidget(
                                title: "Tanggal Dibacakan",
                                subtitle: "25 November 2021"),
                            InfoDetailMarginNoWidget(
                                title: "Nomor Perkara",
                                subtitle: "91/PUU-XVIII/2020"),
                            InfoDetailMarginNoWidget(
                                title: "Penggugat",
                                subtitle: "Hakimi Irwan Bangkid Pamungkas dkk"),
                            InfoDetailMarginNoWidget(
                                title: "Tergugat", subtitle: "-"),
                            InfoDetailMarginNoWidget(
                                title: "Objek Gugatan", subtitle: "-"),
                            InfoDetailMarginNoWidget(
                                title: "Petitum", subtitle: "-"),
                            InfoDetailMarginNoWidget(
                                title: "Lokasi", subtitle: "Jakarta"),
                            InfoDetailMarginNoWidget(
                                title: "Bahasa", subtitle: "Indonesia"),
                            InfoDetailMarginNoWidget(
                                title: "Status Putusan", subtitle: "Tetap"),
                            InfoDetailMarginNoWidget(
                                title: "Lampiran",
                                subtitle: "Dokumen Lampiran"),
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
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
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
