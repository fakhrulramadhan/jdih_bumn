import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jdih_bumn/data/model/response/produk_hukum_response_model.dart';
import 'package:jdih_bumn/presentation/monografi_detail/widget/bagikan_monografi_widget.dart';
import 'package:jdih_bumn/presentation/monografi_detail/widget/icon_monogtrafi_info_widget.dart';

import 'package:dio/dio.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/info_detail_widget.dart';
import 'package:share_plus/share_plus.dart';

class MonografiDetailScreen extends StatefulWidget {
  final ProdukHukumResponseModel produkhukum;
  const MonografiDetailScreen({
    Key? key,
    required this.produkhukum,
  }) : super(key: key);

  @override
  State<MonografiDetailScreen> createState() => _MonografiDetailScreenState();
}

class _MonografiDetailScreenState extends State<MonografiDetailScreen> {
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
      // appBar: AppBar(
      //   title: const Text("Peraturan"),
      //   actions: const [],
      //   leading: BackButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     color: Colors.black,
      //   ),
      // ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: SafeArea(
          child: SizedBox(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 500,
                  child: Stack(
                    children: [
                      Container(
                        height: 450,
                        width: MediaQuery.of(context).size.width,
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        // decoration: const BoxDecoration(
                        //     borderRadius: BorderRadius.all(
                        //       Radius.circular(
                        //         12.0,
                        //       ),
                        //     ),
                        //     image: DecorationImage(
                        //         image: AssetImage('assets/images/appbar-bg2.png'),
                        //         fit: BoxFit.cover)),
                        child: Image.asset(
                          "assets/images/appbar-bg2.png",
                          width: MediaQuery.of(context).size.width,
                          height: 450,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Monografi",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "${widget.produkhukum.judul}",
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Image.asset(
                              "assets/images/lorem-book-ori-removebg.png",
                              width: 200.0,
                              height: 220.0,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        //bottom: -100,
                        child: SizedBox(
                          height: 490,
                          width: MediaQuery.of(context).size.width,
                          //padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 400.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconMonografiInfoWidget(
                                      imageUrl: "assets/images/buku.svg",
                                      title: "${widget.produkhukum.jenis}",
                                      subtitle: "Jenis Monografi"),
                                  IconMonografiInfoWidget(
                                      imageUrl: "assets/images/kalender.svg",
                                      title:
                                          "${widget.produkhukum.tahunPengundangan}",
                                      subtitle: "Tahun Terbit"),
                                  IconMonografiInfoWidget(
                                      imageUrl: "assets/images/bahasa.svg",
                                      title: "${widget.produkhukum.bahasa}",
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
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Detail Peraturan",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                InfoDetailWidget(
                  title: "Deskripsi Fisik",
                  subtitle: "${widget.produkhukum.deskripsiFisik}",
                  heightTitle: 100,
                ),
                InfoDetailWidget(
                    title: "T.E.U Badan/Pengarang",
                    subtitle: "${widget.produkhukum.teuBadan}"),
                InfoDetailWidget(
                    title: "No. Induk Buku",
                    heightTitle: 100,
                    subtitle: "${widget.produkhukum.nomorIndukBuku}"),
                const InfoDetailWidget(title: "Cetakan/Edisi", subtitle: "-"),
                InfoDetailWidget(
                    title: "Tempat Terbit",
                    subtitle: "${widget.produkhukum.tempatTerbit}"),
                InfoDetailWidget(
                    title: "Subjek", subtitle: "${widget.produkhukum.subjek}"),
                InfoDetailWidget(
                    title: "Tempat Penetapan",
                    subtitle: "${widget.produkhukum.tempatTerbit}"),
                InfoDetailWidget(
                    title: "ISBN", subtitle: "${widget.produkhukum.isbn}"),
                InfoDetailWidget(
                    title: "Tanggal-bulan-tahun Pengundangan",
                    subtitle: "${widget.produkhukum.tanggalPengundangan}"),
                InfoDetailWidget(
                    title: "Sumber", subtitle: "${widget.produkhukum.sumber}"),
                InfoDetailWidget(
                    title: "Subjek", subtitle: "${widget.produkhukum.subjek}"),
                InfoDetailWidget(
                    title: "Bidang Hukum",
                    subtitle: "${widget.produkhukum.bidangHukum}"),
                const InfoDetailWidget(
                    title: "Lokasi", subtitle: "Kementerian BUMN"),
                const InfoDetailWidget(title: "Lampiran", subtitle: "-"),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Center(child: BagikanButtonMonografiWidget(
            onPressed: () async {
              const urlLink = "https://www.youtube.com/watch?v=CNUBhb_cM6E";

              await Share.share("This cat is cute $urlLink");
            },
          ))),
    );
  }
}
