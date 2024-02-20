import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:jdih_bumn/data/model/response/stage/putusan_response_model.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/bagikan_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/download_button_widget.dart';
import 'package:jdih_bumn/presentation/putusan_detail/widget/info_detail_no_margin_widget.dart';
import 'package:share_plus/share_plus.dart';

class PutusanDetailScreen extends StatefulWidget {
  final Item putusan;

  const PutusanDetailScreen({super.key, required this.putusan});

  @override
  State<PutusanDetailScreen> createState() => _PutusanDetailScreenState();
}

class _PutusanDetailScreenState extends State<PutusanDetailScreen> {
  late ScrollController _scrollController;

  // Track the progress of a downloaded file here.
  double progress = 0;
  double? _progress;

  // Track if the PDF was downloaded here.
  bool didDownloadPDF = false;

  // Show the progress status to the user.
  String progressString = 'File has not been downloaded yet.';

  void updateProgress(done, total) {
    progress = done / total;
    setState(() {
      if (progress >= 1) {
        progressString =
            '✅ File has finished downloading. Try opening the file.';
        didDownloadPDF = true;
      } else {
        progressString =
            'Download progress: ${(progress * 100).toStringAsFixed(0)}% done.';
      }
    });
  }

  Future download(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: updateProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      var file = File(savePath).openSync(mode: FileMode.write);
      file.writeFromSync(response.data);
      await file.close();

      // Here, you're catching an error and printing it. For production
      // apps, you should display the warning to the user and give them a
      // way to restart the download.
    } catch (e) {
      print(e);
    }
  }

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
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          //mainAxisSize: MainAxisSize.min,d
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
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        "assets/images/appbar-bg2.png",
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
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
                            fontWeight: FontWeight.w400,
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
                      child: Column(
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
                              subtitle: "${widget.putusan.judul}"),
                          InfoDetailMarginNoWidget(
                              title: "T.E.U Badan/Pengarang",
                              subtitle: widget.putusan.teuBadan ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Singkatan Jenis/Bentuk Peraturan",
                              subtitle:
                                  widget.putusan.singkatanPeradilan ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Bidang Hukum",
                              subtitle: widget.putusan.bidangHukum ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Sumber",
                              subtitle: widget.putusan.namaSumber ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Subjek",
                              subtitle: widget.putusan.namaSubjek ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Tanggal Dibacakan",
                              subtitle: "25 November 2021"),
                          InfoDetailMarginNoWidget(
                              title: "Nomor Perkara",
                              subtitle: widget.putusan.nomorPerkara ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Penggugat",
                              subtitle: widget.putusan.penggugat ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Tergugat",
                              subtitle: widget.putusan.tergugat ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Objek Gugatan",
                              subtitle: widget.putusan.objekGugatan ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Petitum",
                              subtitle: widget.putusan.petitum ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Lokasi",
                              subtitle: widget.putusan.lokasi ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Bahasa",
                              subtitle: widget.putusan.bahasa ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Status Putusan",
                              subtitle: widget.putusan.statusPutusan ?? "-"),
                          InfoDetailMarginNoWidget(
                              title: "Lampiran",
                              subtitle:
                                  widget.putusan.deskripsiLampiran ?? "-"),
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
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              child: BagikanButtonWidget(
                onPressed: () async {
                  String urlLink = widget.putusan.urlDetailPutusan ?? "-";

                  //masukkin kata katanya di tanda kutip
                  await Share.share("$urlLink");

                  print("${widget.putusan.urlDetailFilePutusan}");
                },
              ),
            ),
            widget.putusan.urlDetailFilePutusan ==
                    "https://jdihstage.bumn.go.id/storage/putusan/"
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                  )
                : Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: _progress != null
                        ? Center(child: CircularProgressIndicator())
                        : DownloadButtonWidget(
                            onTap: () async {
                              // await download(Dio(), "${widget.putusan.urlDetailFilePutusan}",
                              //     '/storage/emulated/0/Download');

                              print("${widget.putusan.urlDetailFilePutusan}");

                              await FileDownloader.downloadFile(
                                url: "${widget.putusan.urlDetailFilePutusan}",
                                onProgress: (fileName, progresz) {
                                  setState(() {
                                    _progress = progresz;
                                  });
                                },
                                onDownloadCompleted: (path) {
                                  print('Path: $path');

                                  setState(() {
                                    _progress = null;
                                  });
                                },
                              );
                            },
                          ),
                  )
            // DownloadButtonWidget(
            //   onTap: () async {
            //     await download(Dio(), url, savePath);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
