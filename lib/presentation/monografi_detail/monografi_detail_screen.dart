import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    var parsedDate =
        DateTime.parse('${widget.produkhukum.tanggalPengundangan}');

    String convertedDate = DateFormat("dd-MM-yyyy").format(parsedDate);

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
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: widget.produkhukum.judul!.length >= 130
                      ? 440
                      : widget.produkhukum.judul!.length >= 80 &&
                              widget.produkhukum.judul!.length <= 129
                          ? 420
                          : 400,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 450,
                        width: MediaQuery.of(context).size.width,
                        // margin:
                        //     const EdgeInsets.only(left: 20, right: 20, top: 20),
                        // decoration: const BoxDecoration(
                        //     borderRadius: BorderRadius.all(
                        //       Radius.circular(
                        //         12.0,
                        //       ),
                        //     ),
                        //     image: DecorationImage(
                        //         image: AssetImage('assets/images/appbar-bg2.png'),
                        //         fit: BoxFit.cover)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            "assets/images/appbar-bg2.png",
                            width: MediaQuery.of(context).size.width,
                            height: 450,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        //constraints: BoxConstraints(maxHeight: 400),
                        //height: 530 + 40 kalau titlenya panjang,
                        height: widget.produkhukum.judul!.length >= 130
                            ? 440
                            : widget.produkhukum.judul!.length >= 80 &&
                                    widget.produkhukum.judul!.length <= 129
                                ? 420
                                : 400,
                        width: MediaQuery.of(context).size.width,
                        //top sebelumnya 20
                        //color: Colors.brown,
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                BackButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                SizedBox(
                                  width:
                                      0.165 * MediaQuery.of(context).size.width,
                                ),
                                const Text(
                                  "Monografi",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              //height normalanya 80 kalau titlenya enggak
                              //panjang
                              constraints: const BoxConstraints(maxHeight: 160),
                              //height: 120,
                              //color: Colors.brown,
                              //padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${widget.produkhukum.judul}",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: widget.produkhukum.judul!.length >= 200
                                  ? 10.0
                                  : 20,
                            ),
                            Image.asset(
                              "assets/images/monos-remove.png",
                              // width: 170,
                              // height: 190,
                              width: widget.produkhukum.judul!.length >= 190
                                  ? 140.0
                                  : 180,
                              height: widget.produkhukum.judul!.length >= 190
                                  ? 210.0
                                  : 240,

                              fit: BoxFit.fill,
                            ),
                            // const SizedBox(
                            //   height: 10.0,
                            // ),
                          ],
                        ),
                      ),
                      // Container(
                      //   height:
                      //       widget.produkhukum.judul!.length >= 190 ? 590 : 490,
                      //   width: MediaQuery.of(context).size.width,
                      //   //padding: const EdgeInsets.only(top: 18),
                      //   //color: Colors.brown,
                      //   child: Column(
                      //     children: [
                      //       SizedBox(
                      //         height: widget.produkhukum.judul!.length >= 180
                      //             ? 400.0
                      //             : 385, //395
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //         children: [
                      //           IconMonografiInfoWidget(
                      //               imageUrl: "assets/images/buku.svg",
                      //               title: "${widget.produkhukum.jenis}",
                      //               subtitle: "Jenis Monografi"),
                      //           IconMonografiInfoWidget(
                      //               imageUrl: "assets/images/kalender.svg",
                      //               title:
                      //                   "${widget.produkhukum.tahunPengundangan}",
                      //               subtitle: "Tahun Terbit"),
                      //           IconMonografiInfoWidget(
                      //               imageUrl: "assets/images/bahasa.svg",
                      //               title: "${widget.produkhukum.bahasa}",
                      //               subtitle: "Bahasa")
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconMonografiInfoWidget(
                          imageUrl: "assets/images/buku.svg",
                          title: "${widget.produkhukum.jenis}",
                          subtitle: "Jenis Monografi"),
                      IconMonografiInfoWidget(
                          imageUrl: "assets/images/kalender.svg",
                          title: "${widget.produkhukum.tahunPengundangan}",
                          subtitle: "Tahun Terbit"),
                      IconMonografiInfoWidget(
                          imageUrl: "assets/images/bahasa.svg",
                          title: "${widget.produkhukum.bahasa}",
                          subtitle: "Bahasa")
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Detail Peraturan",
                      style: TextStyle(
                        fontSize: 12.0,
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
                ),
                InfoDetailWidget(
                    title: "T.E.U Badan/Pengarang",
                    subtitle: "${widget.produkhukum.teuBadan}"),
                InfoDetailWidget(
                    title: "No. Induk Buku",
                    subtitle: "${widget.produkhukum.nomorIndukBuku}"),
                const InfoDetailWidget(title: "Cetakan/Edisi", subtitle: "-"),
                InfoDetailWidget(
                    title: "Tempat Terbit",
                    subtitle: "${widget.produkhukum.tempatTerbit}"),
                InfoDetailWidget(
                  title: "Subjek",
                  subtitle: "${widget.produkhukum.subjek}",
                  heightTitle:
                      widget.produkhukum.subjek!.length >= 35 ? 90 : 70,
                ),
                InfoDetailWidget(
                    title: "Tempat Penetapan",
                    subtitle: "${widget.produkhukum.tempatTerbit}"),
                InfoDetailWidget(
                    title: "ISBN", subtitle: "${widget.produkhukum.isbn}"),
                InfoDetailWidget(
                    title: "Tanggal-bulan-tahun Pengundangan",
                    subtitle: convertedDate),
                InfoDetailWidget(
                    title: "Sumber", subtitle: "${widget.produkhukum.sumber}"),
                // InfoDetailWidget(
                //   title: "Subjek",
                //   subtitle: "${widget.produkhukum.subjek}",
                //   heightTitle:
                //       widget.produkhukum.subjek!.length >= 35 ? 90 : 70,
                // ),
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
      bottomNavigationBar: Container(
          height: 55,
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
          margin: const EdgeInsets.only(bottom: 5),
          child: Center(child: BagikanButtonMonografiWidget(
            onPressed: () async {
              const urlLink = "https://www.youtube.com/watch?v=CNUBhb_cM6E";

              await Share.share("This cat is cute $urlLink");
            },
          ))),
    );
  }
}
