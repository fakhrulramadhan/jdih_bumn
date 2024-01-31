import 'dart:io';

import 'package:flutter/material.dart';

import 'package:jdih_bumn/presentation/peraturan_detail/widget/bagikan_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/download_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/icon_info_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/info_detail_widget.dart';
//import 'widget/icon_info_widget.dart';

import 'package:dio/dio.dart';
import 'package:share_plus/share_plus.dart';

class PeraturanBumnDetailScreen extends StatefulWidget {
  const PeraturanBumnDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PeraturanBumnDetailScreen> createState() =>
      _PeraturanBumnDetailScreenState();
}

class _PeraturanBumnDetailScreenState extends State<PeraturanBumnDetailScreen> {
  // Track the progress of a downloaded file here.
  double progress = 0;

  // Track if the PDF was downloaded here.
  bool didDownloadPDF = false;

  // Show the progress status to the user.
  String progressString = 'File has not been downloaded yet.';

  late ScrollController _scrollController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peraturan BUMN"),
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
                height: 350,
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
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Surat Edaran Menteri BUMN",
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
                            "SE-7/MBU/07/2020",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Nilai-nilai Utama (Core Values) Sumber Daya Manusia Badan Usaha Milik Negara",
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
                    Positioned(
                      //bottom: -100,
                      child: SizedBox(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        //padding: const EdgeInsets.only(top: 20),
                        child: const Column(
                          children: [
                            SizedBox(
                              height: 260.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconInfoWidget(
                                    imageUrl: "assets/images/berlaku.svg",
                                    title: "Berlaku",
                                    subtitle: "Status"),
                                IconInfoWidget(
                                    imageUrl: "assets/images/kalender.svg",
                                    title: "01-07-2020",
                                    subtitle: "Tahun Terbit"),
                                IconInfoWidget(
                                    imageUrl: "assets/images/view.svg",
                                    title: "2.731 K",
                                    subtitle: "Dilihat"),
                                IconInfoWidget(
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
              const InfoDetailWidget(
                title: "Abstrak",
                subtitle: "-",
                heightTitle: 100,
              ),
              const InfoDetailWidget(
                  title: "Tipe Dokumen", subtitle: "Peraturan"),
              const InfoDetailWidget(
                  title: "Judul",
                  heightTitle: 130,
                  subtitle:
                      "Nilai-nilai Utama (Core Values) Sumber Daya Manusia Badan Usaha Milik Negara"),
              const InfoDetailWidget(
                  title: "T.E.U Badan/Pengarang", subtitle: "-"),
              const InfoDetailWidget(
                  title: "Nomor Peraturan", subtitle: "SE-7/MBU/07/2020"),
              const InfoDetailWidget(title: "Tahun Peraturan", subtitle: "-"),
              const InfoDetailWidget(
                  title: "Jenis Peraturan",
                  subtitle: "Surat Edaran Menteri BUMN"),
              const InfoDetailWidget(
                  title: "Singkatan Jenis/Bentuk Peraturan",
                  subtitle: "SEMENBUMN"),
              const InfoDetailWidget(
                  title: "Tempat Penetapan", subtitle: "JAKARTA"),
              const InfoDetailWidget(
                  title: "Tanggal-bulan-tahun Pengundangan",
                  subtitle: "01-07-2020"),
              const InfoDetailWidget(title: "Sumber", subtitle: "-"),
              const InfoDetailWidget(
                  title: "Subjek",
                  subtitle: "DEWAN KOMISARIS/DEAN PENGAWAS-ORGAN PENDUKUNG"),
              const InfoDetailWidget(
                  title: "Detail Status Peraturan", subtitle: "-"),
              const InfoDetailWidget(title: "Lokasi", subtitle: "-"),
              const InfoDetailWidget(
                  title: "Bidang Hukum", subtitle: "Hukum Administrasi Negara"),
              const InfoDetailWidget(title: "Lampiran", subtitle: "-"),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
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
