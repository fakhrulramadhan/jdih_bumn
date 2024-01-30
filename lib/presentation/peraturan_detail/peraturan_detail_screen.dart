import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jdih_bumn/data/model/response/peraturan_hukum_response_model.dart';

import 'package:jdih_bumn/presentation/peraturan_detail/widget/bagikan_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/download_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/info_detail_widget.dart';
import 'widget/icon_info_widget.dart';

import 'package:dio/dio.dart';
import 'package:share_plus/share_plus.dart';

class PeraturanDetailScreen extends StatefulWidget {
  final Item peraturanHukum;
  const PeraturanDetailScreen({
    Key? key,
    required this.peraturanHukum,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peraturan"),
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
        controller: ScrollController(),
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
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12)
                        // image: DecorationImage(
                        //     image: AssetImage('assets/images/appbar-bg2.png'),
                        //     fit: BoxFit.cover)
                        ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
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
                          "${widget.peraturanHukum.bentuk}",
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "${widget.peraturanHukum.perNo}",
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
                          "${widget.peraturanHukum.tentang}",
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconInfoWidget(
                                  imageUrl: "assets/images/berlaku.svg",
                                  title: widget.peraturanHukum.status!.isEmpty
                                      ? '-'
                                      : "Baru",
                                  subtitle: "Status"),
                              IconInfoWidget(
                                  imageUrl: "assets/images/kalender.svg",
                                  title: "${widget.peraturanHukum.tahun}",
                                  subtitle: "Tahun Terbit"),
                              IconInfoWidget(
                                  imageUrl: "assets/images/view.svg",
                                  title:
                                      "${widget.peraturanHukum.readingCounter}",
                                  subtitle: "Dilihat"),
                              const IconInfoWidget(
                                  imageUrl: "assets/images/bahasa.svg",
                                  title: "Indonesia",
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
            InfoDetailWidget(
              title: "Abstrak",
              subtitle: widget.peraturanHukum.abstraksi ?? "-",
              heightTitle:
                  widget.peraturanHukum.abstraksi!.isNotEmpty ? 350 : 100,
            ),
            InfoDetailWidget(
                title: "Tipe Dokumen",
                subtitle: "${widget.peraturanHukum.bentuk}"),
            InfoDetailWidget(
                title: "Judul",
                heightTitle:
                    widget.peraturanHukum.abstraksi!.isNotEmpty ? 130 : 100,
                subtitle: "${widget.peraturanHukum.tentang}"),
            const InfoDetailWidget(
                title: "T.E.U Badan/Pengarang",
                subtitle: "Indonesia. Kementerian BUMN"),
            InfoDetailWidget(
                title: "Nomor Peraturan",
                subtitle: "${widget.peraturanHukum.perNo}"),
            InfoDetailWidget(
                title: "Jenis Peraturan",
                subtitle: "${widget.peraturanHukum.bentuk}"),
            InfoDetailWidget(
                title: "Singkatan Jenis/Bentuk Peraturan",
                subtitle: "${widget.peraturanHukum.bentuk}"),
            const InfoDetailWidget(
                title: "Tempat Penetapan", subtitle: "JAKARTA"),
            InfoDetailWidget(
                title: "Tanggal-bulan-tahun Penetapan",
                subtitle: "${widget.peraturanHukum.tanggal}"),
            const InfoDetailWidget(
                title: "Tanggal-bulan-tahun Pengundangan",
                subtitle: "06-12-2023"),
            const InfoDetailWidget(title: "Sumber", subtitle: "-"),
            const InfoDetailWidget(title: "Subjek", subtitle: "Subjek"),
            InfoDetailWidget(
                title: "Detail Status Peraturan",
                subtitle: widget.peraturanHukum.status!.isEmpty ? "-" : "Baru"),
            const InfoDetailWidget(
                title: "Lokasi", subtitle: "Kementerian BUMN"),
            const InfoDetailWidget(
                title: "Bidang Hukum", subtitle: "Hukum Administrasi Negara"),
            const InfoDetailWidget(title: "Lampiran", subtitle: "-"),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BagikanButtonWidget(
              onPressed: () async {
                const urlLink = "https://www.youtube.com/watch?v=CNUBhb_cM6E";

                await Share.share("This Cat is cute $urlLink");

                // showModalBottomSheet<void>(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return Container(
                //       height: 200,
                //       color: Colors.white,
                //       child: Row(
                //       children: [

                //       ],
                //       ),
                //     );

                //   },
                // );
              },
            ),
            const DownloadButtonWidget()
            // const DownloadButtonWidget(
            //     onTap: didDownloadPDF
            //         ? null
            //         : () async {
            //             var tempDir = await getTemporaryDirectory();
            //             download(Dio(), ${widget.peraturanHukum.fileId}, tempDir.path + fileName);
            //           },
            //     ),
          ],
        ),
      ),
    );
  }
}
