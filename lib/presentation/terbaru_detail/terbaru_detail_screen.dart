import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_close_app/flutter_close_app.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:intl/intl.dart';
// import 'package:jdih_bumn/data/model/response/peraturan_hukum_response_model.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_terbaru_response_model.dart';

import 'package:jdih_bumn/presentation/peraturan_detail/widget/bagikan_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/download_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/info_detail_status_peraturan_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/info_detail_widget.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';
import '../peraturan_detail/widget/icon_info_widget.dart';
import 'widget/icon_info_widget.dart';

import 'package:dio/dio.dart';
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
  double? _progress;

  bool isPermission = false;

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

  isStoragePermission() async {
    var isStorage = await Permission.storage.status;
    if (!isStorage.isGranted) {
      await Permission.storage.request();
      if (!isStorage.isGranted) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  checkPermission() async {
    var permission = await isStoragePermission();
    if (permission) {
      setState(() {
        isPermission = true;
      });
    }
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

//ambil data dari api kalau tipe datanya enum
  String toShortString() {
    return toString().split('.').last;
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    // var parsedDate = DateTime.parse('${widget.peraturanTerbaru.tglPenetapan}');
    // var parsedDatePerngundangan =
    //     DateTime.parse('${widget.peraturanTerbaru.tanggalPengundangan}');

    // String convertedDate = DateFormat("dd-MM-yyyy").format(parsedDate);

    // String convertedDateUndang =
    //     DateFormat("dd-MM-yyyy").format(parsedDatePerngundangan);

    List<Widget> buildListItems() {
      List<Widget> items = [];

      widget.peraturanTerbaru.detailStatusPeraturan?.forEach((map) {
        items.add(
          // ListTile(
          //   title: Text('${map.detailNamaStatus}' ?? ''),
          //   subtitle: Text('${map.perNoObjek}' ?? ''),
          // ),
          Row(
            children: [
              //tanda titiknya dibuang, dan tulisan setelah
              //titik diambil
              const Text(
                '• ',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Text(
                map.detailNamaStatus.toString().split('.').last ?? '',
                style: const TextStyle(
                    fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 3.0,
              ),
              Text(
                map.perNoObjek ?? '',
                style: const TextStyle(
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        );
      });

      return items;
    }

    return FlutterCloseAppPage(
      interval: 2,
      condition: true,
      onCloseFailed: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Tekan Sekali Lagi Untuk Keluar Aplikasi"),
        ));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
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
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            //tetap butuh height agar ukurannya proporsional
            // (di detail), hapus height di list peraturanTerbaru
            children: [
              Container(
                height: widget.peraturanTerbaru.bahasa
                            .toString()
                            .split('.')
                            .last
                            .length <=
                        9
                    ? 380
                    : 390, //350
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Stack(
                  children: [
                    Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
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
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),

                          // "${widget.peraturanTerbaru.teuBadan.toString().split('.').last ?? ''}",
                          Container(
                            height: widget.peraturanTerbaru.deskripsiTentang!
                                        .length <=
                                    65
                                ? 70
                                : 80,
                            //color: Colors.yellow,
                            child: Text(
                              "${widget.peraturanTerbaru.deskripsiTentang ?? '-'}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          const SizedBox(
                            height: 17.0,
                          ),
                          Text(
                            widget.peraturanTerbaru.perNoBaru ?? '-',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                          SizedBox(
                            height: widget.peraturanTerbaru.deskripsiTentang!
                                        .length <=
                                    70
                                ? 20
                                : 12.0,
                          ),
                          Container(
                            height: 80,
                            //color: Colors.yellow,
                            child: Text(
                              widget.peraturanTerbaru.deskripsiTentang ?? '-',
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: widget.peraturanTerbaru.bahasa
                                  .toString()
                                  .split('.')
                                  .last
                                  .length <=
                              9
                          ? 380
                          : 390, //350 (ikutin tinggi parent containernya)
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.green,
                      //padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          // const SizedBox(
                          //   height: 100.0,
                          // ),
                          SizedBox(
                              height: widget.peraturanTerbaru.bahasa
                                          .toString()
                                          .split('.')
                                          .last
                                          .length <=
                                      9
                                  ? 270
                                  : 263
                              // widget.peraturanTerbaru.bahasa!.toString().length > 9
                              //     ? 263
                              //     : 100, //263
                              ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconInfoWidget(
                                  imageUrl: "assets/images/berlaku.svg",
                                  title: widget.peraturanTerbaru.status == null
                                      ? '-'
                                      : "Baru",
                                  subtitle: "Status"),
                              IconInfoWidget(
                                  imageUrl: "assets/images/kalender.svg",
                                  title: widget
                                          .peraturanTerbaru.tahunPengundangan ??
                                      '',
                                  subtitle: "Tahun Terbit"),
                              IconInfoWidget(
                                  imageUrl: "assets/images/view.svg",
                                  title:
                                      "${widget.peraturanTerbaru.countReader ?? ''}",
                                  subtitle: "Dilihat"),
                              // karakter _ diganti dengan &
                              widget.peraturanTerbaru.bahasa != null
                                  ? IconInfoWidget(
                                      imageUrl: "assets/images/bahasa.svg",
                                      title: widget.peraturanTerbaru.bahasa
                                          .toString()
                                          .split('.')
                                          .last
                                          .replaceAll('_', ' & '),
                                      subtitle: "Bahasa")
                                  : IconInfoWidget(
                                      imageUrl: "assets/images/bahasa.svg",
                                      title: "-",
                                      subtitle: "Bahasa")
                            ],
                          ),
                        ],
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
                  subtitle: widget.peraturanTerbaru.fileAbstrak ?? '-',
                  heightTitle:
                      widget.peraturanTerbaru.fileAbstrak == null ? 80 : 90),
              const InfoDetailWidget(
                title: "Tipe Dokumen",
                subtitle: "Peraturan",
                heightTitle: 80,
              ),
              InfoDetailWidget(
                  title: "Judul",
                  heightTitle: widget
                          .peraturanTerbaru.deskripsiTentang!.isNotEmpty
                      ? widget.peraturanTerbaru.deskripsiTentang!.length >= 3180
                          ? 1140 //1150
                          : widget.peraturanTerbaru.deskripsiTentang!.length >= 1065 &&
                                  widget.peraturanTerbaru.deskripsiTentang!.length <=
                                      2999
                              ? 560
                              : widget.peraturanTerbaru.deskripsiTentang!.length >= 400 &&
                                      widget.peraturanTerbaru.deskripsiTentang!.length <=
                                          1064
                                  ? 470
                                  : widget.peraturanTerbaru.deskripsiTentang!.length >= 201 &&
                                          widget.peraturanTerbaru.deskripsiTentang!.length <=
                                              399
                                      ? 600
                                      : widget.peraturanTerbaru.deskripsiTentang!.length >= 101 &&
                                              widget
                                                      .peraturanTerbaru
                                                      .deskripsiTentang!
                                                      .length <=
                                                  200
                                          ? 120
                                          : widget.peraturanTerbaru.deskripsiTentang!.length > 30 &&
                                                  widget
                                                          .peraturanTerbaru
                                                          .deskripsiTentang!
                                                          .length <=
                                                      100
                                              ? 100
                                              : widget.peraturanTerbaru.deskripsiTentang!.length >= 5 &&
                                                      widget
                                                              .peraturanTerbaru
                                                              .deskripsiTentang!
                                                              .length <=
                                                          30
                                                  ? 90
                                                  : 90
                      : 90,
                  subtitle: widget.peraturanTerbaru.deskripsiTentang ?? ''),
              widget.peraturanTerbaru.teuBadan != null
                  ? InfoDetailWidget(
                      title: "T.E.U Badan/Pengarang",
                      subtitle: widget.peraturanTerbaru.teuBadan
                          .toString()
                          .split('.')
                          .last
                          .replaceAll('_', ' '),
                      heightTitle: 80)
                  : InfoDetailWidget(
                      title: "T.E.U Badan/Pengarang",
                      subtitle: '-',
                      heightTitle: 80),
              InfoDetailWidget(
                title: "Nomor Peraturan",
                subtitle: widget.peraturanTerbaru.nomorPeraturanBaru ?? '-',
                heightTitle: 80,
              ),
              widget.peraturanTerbaru.jenis != null
                  ? InfoDetailWidget(
                      title: "Jenis Peraturan",
                      subtitle: widget.peraturanTerbaru.jenis
                          .toString()
                          .split('.')
                          .last
                          .replaceAll("_", " "),
                      heightTitle: 80,
                    )
                  : InfoDetailWidget(
                      title: "Jenis Peraturan",
                      subtitle: "-",
                      heightTitle: 80,
                    ),
              widget.peraturanTerbaru.singkatanJenis != null
                  ? InfoDetailWidget(
                      title: "Singkatan Jenis/Bentuk Peraturan",
                      subtitle: widget.peraturanTerbaru.singkatanJenis
                          .toString()
                          .split('.')
                          .last,
                      heightTitle: 80,
                    )
                  : InfoDetailWidget(
                      title: "Singkatan Jenis/Bentuk Peraturan",
                      subtitle: '-',
                      heightTitle: 80,
                    ),
              widget.peraturanTerbaru.tempatTerbit != null
                  ? InfoDetailWidget(
                      title: "Tempat Penetapan",
                      subtitle: widget.peraturanTerbaru.tempatTerbit
                              .toString()
                              .split('.')
                              .last ??
                          '-',
                      heightTitle: 80,
                    )
                  : InfoDetailWidget(
                      title: "Tempat Penetapan",
                      subtitle: '-',
                      heightTitle: 80,
                    ),
              widget.peraturanTerbaru.tglPenetapan == null
                  ? InfoDetailWidget(
                      title: "Tanggal-bulan-tahun Penetapan",
                      subtitle: "-",
                      heightTitle: 80,
                    )
                  : InfoDetailWidget(
                      title: "Tanggal-bulan-tahun Penetapan",
                      subtitle: DateFormat('dd-MM-yyyy').format(DateTime.parse(
                          '${widget.peraturanTerbaru.tglPenetapan}')),
                      heightTitle: 80,
                    ),
              widget.peraturanTerbaru.tanggalPengundangan == null
                  ? InfoDetailWidget(
                      title: "Tanggal-bulan-tahun Penetapan",
                      subtitle: "-",
                      heightTitle: 80,
                    )
                  : InfoDetailWidget(
                      title: "Tanggal-bulan-tahun Penetapan",
                      subtitle: DateFormat('dd-MM-yyyy').format(DateTime.parse(
                          '${widget.peraturanTerbaru.tanggalPengundangan}')),
                      heightTitle: 80,
                    ),
              widget.peraturanTerbaru.sumber != null
                  ? InfoDetailWidget(
                      title: "Sumber",
                      subtitle: widget.peraturanTerbaru.sumber
                                  .toString()
                                  .split('.')
                                  .last ==
                              'EMPTY'
                          ? '-'
                          : '-',
                      heightTitle: 80,
                    )
                  : InfoDetailWidget(
                      title: "Sumber",
                      subtitle: '-',
                      heightTitle: 80,
                    ),
              InfoDetailWidget(
                title: "Subjek",
                subtitle: widget.peraturanTerbaru.subjek?[0] ?? '-',
                heightTitle: widget.peraturanTerbaru.subjek != '-' ? 90 : 80,
              ),
              InfoDetailWidget(
                  title: "Status",
                  subtitle: "${widget.peraturanTerbaru.status ?? '-'}"),
              InfoDetailStatusPeraturanWidget(
                  title: "Detail Status Peraturan",
                  heightTitle: widget.peraturanTerbaru.detailStatusPeraturan![0]
                              .perNoObjek !=
                          null
                      ? widget.peraturanTerbaru.detailStatusPeraturan!.length ==
                              1
                          ? 80
                          : widget.peraturanTerbaru.detailStatusPeraturan!
                                          .length >
                                      1 &&
                                  widget.peraturanTerbaru.detailStatusPeraturan!
                                          .length <=
                                      3
                              ? 120
                              : widget.peraturanTerbaru.detailStatusPeraturan!
                                              .length <=
                                          5 &&
                                      widget.peraturanTerbaru
                                              .detailStatusPeraturan!.length >
                                          3
                                  ? 140
                                  : 190 //240
                      : 80, //ini kalau detailnya enggak ada
                  subWidget: Column(
                    children: widget.peraturanTerbaru.detailStatusPeraturan![0]
                                .detailNamaStatus !=
                            null
                        ? buildListItems()
                        : [Text("-")],
                    // children: [
                    //   _buildListItems(),
                    //   // Text(
                    //   //   "${widget.peraturanTerbaru.detailStatusPeraturan![0].detailNamaStatus.toString().split('.').last} ${widget.peraturanTerbaru.detailStatusPeraturan![0].perNoObjek}",
                    //   //   style: TextStyle(
                    //   //     fontSize: 13.0,
                    //   //   ),
                    //   // ),
                    // ],
                  )),

              // InfoDetailWidget(
              //   title: "Detail Status Peraturan",
              //   subtitle: widget.peraturanTerbaru.detailStatusPeraturan!.isEmpty
              //       ? "-"
              //       : "Baru",
              //   heightTitle: 80,
              // ),
              widget.peraturanTerbaru.tempatTerbit != null
                  ? InfoDetailWidget(
                      title: "Lokasi",
                      subtitle: widget.peraturanTerbaru.tempatTerbit
                          .toString()
                          .split('.')
                          .last,
                      heightTitle: 80,
                    )
                  : InfoDetailWidget(
                      title: "Lokasi",
                      subtitle: '-',
                      heightTitle: 80,
                    ),
              widget.peraturanTerbaru.bidangHukum != null
                  ? InfoDetailWidget(
                      title: "Bidang Hukum",
                      subtitle: widget.peraturanTerbaru.bidangHukum
                          .toString()
                          .split('.')
                          .last
                          .replaceAll('_', ' '),
                      heightTitle: 80,
                    )
                  : InfoDetailWidget(
                      title: "Bidang Hukum",
                      subtitle: '-',
                      heightTitle: 80,
                    ),
              InfoDetailWidget(
                title: "Lampiran",
                subtitle: widget.peraturanTerbaru.fileLampiran ?? "-",
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
          child: Column(
            children: [
              Row(
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
                          "https://jdihstage.bumn.go.id/storage/peraturan/"
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: _progress != null
                              ? const Center(child: CircularProgressIndicator())
                              : DownloadButtonWidget(
                                  onTap: () async {
                                    // await download(Dio(), "${widget.putusan.urlDetailFilePutusan}",
                                    //     '/storage/emulated/0/Download');

                                    print(
                                        "${widget.peraturanTerbaru.urlDownload}");
                                    await checkPermission();
                                    await FileDownloader.downloadFile(
                                      url:
                                          "${widget.peraturanTerbaru.urlDownload}",
                                      onProgress: (fileName, progresz) {
                                        setState(() {
                                          _progress = progresz;
                                        });
                                      },
                                      onDownloadCompleted: (path) {
                                        print('Path: $path');

                                        setState(() {
                                          progress = 0;
                                          _progress = null;
                                        });

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Unduhan Selesai',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            backgroundColor:
                                                Color.fromARGB(255, 2, 25, 117),
                                            action: SnackBarAction(
                                              label: 'Buka File',
                                              textColor: Colors.white,
                                              onPressed: () async {
                                                print(path);
                                                // Open the downloaded file in the Files app
                                                // print(
                                                //     '${path.replaceAll('%', ' ').replaceAll('20', '')}');

                                                print('${path}');
                                                // await OpenFilex.open(
                                                //         '${path.replaceAll('%', ' ').replaceAll('20', '')}')
                                                //     .then((value) {
                                                //   print(value.message.toString());
                                                // });

                                                await OpenFilex.open('${path}')
                                                    .then((value) {
                                                  print(
                                                      value.message.toString());
                                                });

                                                // await SfPdfViewer.file(
                                                //     File('${path}'));
                                              },
                                            ),
                                          ),
                                        );
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
            ],
          ),
        ),
      ),
    );
  }
}
