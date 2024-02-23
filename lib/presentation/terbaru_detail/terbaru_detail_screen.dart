import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:intl/intl.dart';
// import 'package:jdih_bumn/data/model/response/peraturan_hukum_response_model.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_terbaru_response_model.dart';

import 'package:jdih_bumn/presentation/peraturan_detail/widget/bagikan_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/download_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/info_detail_widget.dart';
//import 'widget/icon_info_widget.dart';

import 'package:dio/dio.dart';
import 'package:jdih_bumn/presentation/terbaru_detail/widget/icon_info_widget.dart';
import 'package:jdih_bumn/presentation/terbaru_detail/widget/info_detail_widget.dart';
import 'package:share_plus/share_plus.dart';

class TerbaruDetailScreen extends StatefulWidget {
  final Item peraturanTerbaru;
  const TerbaruDetailScreen({
    Key? key,
    required this.peraturanTerbaru,
  }) : super(key: key);

  @override
  State<TerbaruDetailScreen> createState() => _TerbaruDetailScreenState();
}

class _TerbaruDetailScreenState extends State<TerbaruDetailScreen> {
  // Track the progress of a downloaded file here.
  double progress = 0;

  // Track if the PDF was downloaded here.
  bool didDownloadPDF = false;

  // Show the progress status to the user.
  String progressString = 'File has not been downloaded yet.';

  late ScrollController _scrollController;

  //  var parsedDate = DateTime.parse('${widget.peraturanTerbaru.}');

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
    var parsedDate = DateTime.parse('${widget.peraturanTerbaru.tglPenetapan}');
    var parsedDatePerngundangan =
        DateTime.parse('${widget.peraturanTerbaru.tanggalPengundangan}');

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
                          "${widget.peraturanTerbaru.teuBadan}",
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
                          "${widget.peraturanTerbaru.perNoBaru}",
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
                          "${widget.peraturanTerbaru.judul}",
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
                              IconInfoTerbaruWidget(
                                  imageUrl: "assets/images/berlaku.svg",
                                  title: widget.peraturanTerbaru.status!.isEmpty
                                      ? '-'
                                      : "Baru",
                                  subtitle: "Status"),
                              IconInfoTerbaruWidget(
                                  imageUrl: "assets/images/kalender.svg",
                                  title:
                                      "${widget.peraturanTerbaru.tahunPengundangan}",
                                  subtitle: "Tahun Terbit"),
                              IconInfoTerbaruWidget(
                                  imageUrl: "assets/images/view.svg",
                                  title:
                                      "${widget.peraturanTerbaru.countReader}",
                                  subtitle: "Dilihat"),
                              IconInfoTerbaruWidget(
                                  imageUrl: "assets/images/bahasa.svg",
                                  title: "${widget.peraturanTerbaru.bahasa}",
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
            // widget.peraturanTerbaru.abstraksi!.length <= 200000
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
            InfoDetailTerbaruWidget(
                title: "Abstrak",
                subtitle: widget.peraturanTerbaru.urlFileAbstrak!.isEmpty
                    ? "-"
                    : widget.peraturanTerbaru.urlFileAbstrak!,
                heightTitle: 70),
            const InfoDetailTerbaruWidget(
              title: "Tipe Dokumen",
              subtitle: "Peraturan",
              heightTitle: 80,
            ),
            InfoDetailTerbaruWidget(
                title: "Judul",
                heightTitle: widget.peraturanTerbaru.judul!.isEmpty
                    ? widget.peraturanTerbaru.judul!.length >= 3180
                        ? 1140 //1150
                        : widget.peraturanTerbaru.judul!.length >= 1065 &&
                                widget.peraturanTerbaru.judul!.length <= 2999
                            ? 560
                            : widget.peraturanTerbaru.judul!.length >= 400 &&
                                    widget.peraturanTerbaru.judul!.length <=
                                        1064
                                ? 470
                                : widget.peraturanTerbaru.judul!.length >=
                                            201 &&
                                        widget.peraturanTerbaru.judul!.length <=
                                            399
                                    ? 600
                                    : widget.peraturanTerbaru.judul!.length >=
                                                5 &&
                                            widget.peraturanTerbaru.judul!
                                                    .length <=
                                                30
                                        ? 70
                                        : 70
                    : 70,
                subtitle: "${widget.peraturanTerbaru.judul}"),
            InfoDetailTerbaruWidget(
                title: "T.E.U Badan/Pengarang",
                subtitle: "${widget.peraturanTerbaru.teuBadan}",
                heightTitle: 80),
            InfoDetailTerbaruWidget(
              title: "Nomor Peraturan",
              subtitle: "${widget.peraturanTerbaru.nomorPeraturanBaru}",
              heightTitle: 80,
            ),
            InfoDetailTerbaruWidget(
              title: "Jenis Peraturan",
              subtitle: "${widget.peraturanTerbaru.jenis}",
              heightTitle: 80,
            ),
            InfoDetailTerbaruWidget(
              title: "Singkatan Jenis/Bentuk Peraturan",
              subtitle: "${widget.peraturanTerbaru.singkatanJenis}",
              heightTitle: 80,
            ),
            InfoDetailTerbaruWidget(
              title: "Tempat Penetapan",
              subtitle: "${widget.peraturanTerbaru.tempatTerbit}",
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
              subtitle: "${widget.peraturanTerbaru.sumber}",
              heightTitle: 80,
            ),
            InfoDetailWidget(
              title: "Subjek",
              subtitle: "${widget.peraturanTerbaru.subjek}",
              heightTitle: 80,
            ),
            // InfoDetailWidget(
            //   title: "Detail Status Peraturan",
            //   subtitle: widget.peraturanTerbaru.detailStatusPeraturan!.isEmpty
            //       ? "-"
            //       : "Baru",
            //   heightTitle: 80,
            // ),
            InfoDetailWidget(
              title: "Lokasi",
              subtitle: "${widget.peraturanTerbaru.tempatTerbit}",
              heightTitle: 80,
            ),
            InfoDetailWidget(
              title: "Bidang Hukum",
              subtitle: "${widget.peraturanTerbaru.bidangHukum}",
              heightTitle: 80,
            ),
            InfoDetailWidget(
              title: "Lampiran",
              subtitle: "${widget.peraturanTerbaru.fileLampiran ?? "-"}",
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
                  String urlLink =
                      widget.peraturanTerbaru.urlDetailPeraturan ?? "-";

                  //masukkin kata katanya di tanda kutip
                  await Share.share(urlLink);

                  print("${widget.peraturanTerbaru.urlDetailPeraturan}");
                },
              ),
            ),
            widget.peraturanTerbaru.urlDownload ==
                    "https://jdihstage.bumn.go.id/storage/peraturanTerbaru/"
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

                              print("${widget.peraturanTerbaru.urlDownload}");

                              await FileDownloader.downloadFile(
                                url: "${widget.peraturanTerbaru.urlDownload}",
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
