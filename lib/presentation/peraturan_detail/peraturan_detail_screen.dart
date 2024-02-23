import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:intl/intl.dart';
// import 'package:jdih_bumn/data/model/response/peraturan_hukum_response_model.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_response_model.dart';

import 'package:jdih_bumn/presentation/peraturan_detail/widget/bagikan_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/download_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/info_detail_widget.dart';
import 'widget/icon_info_widget.dart';

import 'package:dio/dio.dart';
import 'package:share_plus/share_plus.dart';

class PeraturanDetailScreen extends StatefulWidget {
  final Item peraturan;
  const PeraturanDetailScreen({
    Key? key,
    required this.peraturan,
  }) : super(key: key);

  @override
  State<PeraturanDetailScreen> createState() => _PeraturanDetailScreenState();
}

class _PeraturanDetailScreenState extends State<PeraturanDetailScreen> {
  // Track the progress of a downloaded file here.
  double progress = 0;

  // Track if the PDF was downloaded here.
  bool didDownloadPDF = false;

  // Show the progress status to the user.
  String progressString = 'File has not been downloaded yet.';

  late ScrollController _scrollController;

  //  var parsedDate = DateTime.parse('${widget.peraturan.}');

  //             String convertedDate =
  //                 DateFormat("dd-MM-yyyy").format(parsedDate);

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  // You can update the download progress here so that the user is
  // aware of the long-running task.
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

  // This method uses Dio to download a file from the given URL
  // and saves the file to the provided `savePath`.
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

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    var parsedDate = DateTime.parse('${widget.peraturan.tglPenetapan}');
    var parsedDatePerngundangan =
        DateTime.parse('${widget.peraturan.tanggalPengundangan}');

    String convertedDate = DateFormat("dd-MM-yyyy").format(parsedDate);

    String convertedDateUndang =
        DateFormat("dd-MM-yyyy").format(parsedDatePerngundangan);

    double? progress;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          title: const Text(
            "Peraturan",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
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
            Container(
              height: 350,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Stack(
                children: [
                  Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12)
                        // image: DecorationImage(
                        //     image: AssetImage('assets/images/appbar-bg2.png'),
                        //     fit: BoxFit.cover)
                        ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
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
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "${widget.peraturan.teuBadan}",
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "${widget.peraturan.perNoBaru}",
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "${widget.peraturan.judul}",
                          style: const TextStyle(
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
                  Positioned(
                    //bottom: -100,
                    child: SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      //padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 260.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconInfoWidget(
                                  imageUrl: "assets/images/berlaku.svg",
                                  title: widget.peraturan.status!.isEmpty
                                      ? '-'
                                      : "Baru",
                                  subtitle: "Status"),
                              IconInfoWidget(
                                  imageUrl: "assets/images/kalender.svg",
                                  title:
                                      "${widget.peraturan.tahunPengundangan}",
                                  subtitle: "Tahun Terbit"),
                              IconInfoWidget(
                                  imageUrl: "assets/images/view.svg",
                                  title: "${widget.peraturan.countReader}",
                                  subtitle: "Dilihat"),
                              IconInfoWidget(
                                  imageUrl: "assets/images/bahasa.svg",
                                  title: "${widget.peraturan.bahasa}",
                                  subtitle: "Bahasa")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // kalau diatas sama dengan 500 karakter, heightnya 1800
            // widget.peraturan.abstraksi!.length <= 200000
            const Padding(
              padding: EdgeInsets.only(left: 17),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Detail Peraturan",
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            InfoDetailWidget(
                title: "Abstrak",
                subtitle: widget.peraturan.urlFileAbstrak!.isEmpty
                    ? "-"
                    : widget.peraturan.urlFileAbstrak!,
                heightTitle: 70),
            const InfoDetailWidget(
              title: "Tipe Dokumen",
              subtitle: "Peraturan",
              heightTitle: 80,
            ),
            InfoDetailWidget(
                title: "Judul",
                heightTitle: widget.peraturan.judul!.isEmpty
                    ? widget.peraturan.judul!.length >= 3180
                        ? 1140 //1150
                        : widget.peraturan.judul!.length >= 1065 &&
                                widget.peraturan.judul!.length <= 2999
                            ? 560
                            : widget.peraturan.judul!.length >= 400 &&
                                    widget.peraturan.judul!.length <= 1064
                                ? 470
                                : widget.peraturan.judul!.length >= 201 &&
                                        widget.peraturan.judul!.length <= 399
                                    ? 600
                                    : widget.peraturan.judul!.length >= 5 &&
                                            widget.peraturan.judul!.length <= 30
                                        ? 70
                                        : 70
                    : 70,
                subtitle: "${widget.peraturan.judul}"),
            InfoDetailWidget(
                title: "T.E.U Badan/Pengarang",
                subtitle: "${widget.peraturan.teuBadan}",
                heightTitle: 80),
            InfoDetailWidget(
              title: "Nomor Peraturan",
              subtitle: "${widget.peraturan.nomorPeraturanBaru}",
              heightTitle: 80,
            ),
            InfoDetailWidget(
              title: "Jenis Peraturan",
              subtitle: "${widget.peraturan.jenis}",
              heightTitle: 80,
            ),
            InfoDetailWidget(
              title: "Singkatan Jenis/Bentuk Peraturan",
              subtitle: "${widget.peraturan.singkatanJenis}",
              heightTitle: 80,
            ),
            InfoDetailWidget(
              title: "Tempat Penetapan",
              subtitle: "${widget.peraturan.tempatTerbit}",
              heightTitle: 80,
            ),
            //"${widget.peraturanHukum.tanggal}"
            InfoDetailWidget(
              title: "Tanggal-bulan-tahun Penetapan",
              subtitle: convertedDate,
              heightTitle: 80,
            ),
            InfoDetailWidget(
              title: "Tanggal-bulan-tahun Pengundangan",
              subtitle: convertedDateUndang,
            ),
            InfoDetailWidget(
              title: "Sumber",
              subtitle: "${widget.peraturan.sumber}",
              heightTitle: 80,
            ),
            InfoDetailWidget(
              title: "Subjek",
              subtitle: "${widget.peraturan.subjek}",
              heightTitle: 80,
            ),
            // InfoDetailWidget(
            //   title: "Detail Status Peraturan",
            //   subtitle: widget.peraturan.detailStatusPeraturan!.isEmpty
            //       ? "-"
            //       : "Baru",
            //   heightTitle: 80,
            // ),
            InfoDetailWidget(
              title: "Lokasi",
              subtitle: "${widget.peraturan.tempatTerbit}",
              heightTitle: 80,
            ),
            InfoDetailWidget(
              title: "Bidang Hukum",
              subtitle: "${widget.peraturan.bidangHukum}",
              heightTitle: 80,
            ),
            InfoDetailWidget(
              title: "Lampiran",
              subtitle: widget.peraturan.fileLampiran ?? "-",
              heightTitle: 80,
            ),
            const SizedBox(
              height: 20.0,
            ),
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
                  offset: const Offset(0, -10),
                  blurRadius: 1),
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: BagikanButtonWidget(
                onPressed: () async {
                  String urlLink = widget.peraturan.urlDetailPeraturan ?? "-";

                  //masukkin kata katanya di tanda kutip
                  await Share.share(urlLink);

                  print("${widget.peraturan.urlDetailPeraturan}");
                },
              ),
            ),
            widget.peraturan.urlDownload ==
                    "https://jdihstage.bumn.go.id/storage/peraturan/"
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: progress != null
                        ? const Center(child: CircularProgressIndicator())
                        : DownloadButtonWidget(
                            onTap: () async {
                              // await download(Dio(), "${widget.putusan.urlDetailFilePutusan}",
                              //     '/storage/emulated/0/Download');

                              print("${widget.peraturan.urlDownload}");

                              await FileDownloader.downloadFile(
                                url: "${widget.peraturan.urlDownload}",
                                onProgress: (fileName, progresz) {
                                  setState(() {
                                    progress = progresz;
                                  });
                                },
                                onDownloadCompleted: (path) {
                                  print('Path: $path');

                                  setState(() {
                                    progress = null;
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
