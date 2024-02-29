import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:intl/intl.dart';
// import 'package:jdih_bumn/data/model/response/peraturan_hukum_response_model.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_populer_response_model.dart';

import 'package:jdih_bumn/presentation/peraturan_detail/widget/bagikan_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/download_button_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/icon_info_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/info_detail_status_peraturan_widget.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/widget/info_detail_widget.dart';

import 'package:dio/dio.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class PopulerDetailScreen extends StatefulWidget {
  final Item peraturanPopuler;
  const PopulerDetailScreen({
    Key? key,
    required this.peraturanPopuler,
  }) : super(key: key);

  @override
  State<PopulerDetailScreen> createState() => _PopulerDetailScreenState();
}

class _PopulerDetailScreenState extends State<PopulerDetailScreen> {
  // Track the progress of a downloaded file here.
  double progress = 0;
  double? _progress;

  // Track if the PDF was downloaded here.
  bool didDownloadPDF = false;

  bool isPermission = false;

  // Show the progress status to the user.
  String progressString = 'File has not been downloaded yet.';

  late ScrollController _scrollController;

  //  var parsedDate = DateTime.parse('${widget.peraturanPopuler.}');

  //             String convertedDate =
  //                 DateFormat("dd-MM-yyyy").format(parsedDate);

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
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
    // var parsedDate = DateTime.parse('${widget.peraturanPopuler.tglPenetapan}');
    // var parsedDatePerngundangan =
    //     DateTime.parse('${widget.peraturanPopuler.tanggalPengundangan}');

    // String convertedDate = widget.peraturanPopuler.tglPenetapan != null
    //     ? DateFormat("dd-MM-yyyy").format(parsedDate)
    //     : "-";

    // String convertedDateUndang =
    //     widget.peraturanPopuler.tanggalPengundangan != null
    //         ? DateFormat("dd-MM-yyyy").format(parsedDatePerngundangan)
    //         : "-";

    double? progress;

    List<Widget> buildListItems() {
      List<Widget> items = [];

      widget.peraturanPopuler.detailStatusPeraturan?.forEach((map) {
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

    return Scaffold(
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
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          //tetap butuh height agar ukurannya proporsional
          // (di detail), hapus height di list peraturanPopuler
          children: [
            Container(
              height: widget.peraturanPopuler.bahasa
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

                        // "${widget.peraturanPopuler.teuBadan.toString().split('.').last ?? ''}",
                        Container(
                          height: widget.peraturanPopuler.judul!.length <= 65
                              ? 70
                              : 80,
                          //color: Colors.yellow,
                          child: Text(
                            widget.peraturanPopuler.judul ?? '-',
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
                          widget.peraturanPopuler.perNoBaru ?? '-',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.visible,
                        ),
                        SizedBox(
                          height: widget.peraturanPopuler.judul!.length <= 70
                              ? 20
                              : 12.0,
                        ),
                        Container(
                          height: 80,
                          //color: Colors.yellow,
                          child: Text(
                            widget.peraturanPopuler.judul ?? '-',
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
                    height: widget.peraturanPopuler.bahasa
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
                            height: widget.peraturanPopuler.bahasa
                                        .toString()
                                        .split('.')
                                        .last
                                        .length <=
                                    9
                                ? 270
                                : 263
                            // widget.peraturanPopuler.bahasa!.toString().length > 9
                            //     ? 263
                            //     : 100, //263
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconInfoWidget(
                                imageUrl: "assets/images/berlaku.svg",
                                title: widget.peraturanPopuler.status == null
                                    ? '-'
                                    : "Baru",
                                subtitle: "Status"),
                            IconInfoWidget(
                                imageUrl: "assets/images/kalender.svg",
                                title:
                                    widget.peraturanPopuler.tahunPengundangan ??
                                        '-',
                                subtitle: "Tahun Terbit"),
                            IconInfoWidget(
                                imageUrl: "assets/images/view.svg",
                                title:
                                    "${widget.peraturanPopuler.countReader ?? '-'}",
                                subtitle: "Dilihat"),
                            // karakter _ diganti dengan &
                            widget.peraturanPopuler.bahasa != null
                                ? IconInfoWidget(
                                    imageUrl: "assets/images/bahasa.svg",
                                    title: widget.peraturanPopuler.bahasa
                                        .toString()
                                        .split('.')
                                        .last
                                        .replaceAll('_', ' & '),
                                    subtitle: "Bahasa")
                                : const IconInfoWidget(
                                    imageUrl: "assets/images/bahasa.svg",
                                    title: '-',
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
            // widget.peraturanPopuler.abstraksi!.length <= 200000
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
                subtitle: widget.peraturanPopuler.fileAbstrak ?? '-',
                heightTitle:
                    widget.peraturanPopuler.fileAbstrak == null ? 80 : 90),
            const InfoDetailWidget(
              title: "Tipe Dokumen",
              subtitle: "Peraturan",
              heightTitle: 80,
            ),
            InfoDetailWidget(
                title: "Judul",
                heightTitle: widget.peraturanPopuler.judul!.isNotEmpty
                    ? widget.peraturanPopuler.judul!.length >= 3180
                        ? 1140 //1150
                        : widget.peraturanPopuler.judul!.length >= 1065 &&
                                widget.peraturanPopuler.judul!.length <= 2999
                            ? 560
                            : widget.peraturanPopuler.judul!.length >= 400 &&
                                    widget.peraturanPopuler.judul!.length <=
                                        1064
                                ? 470
                                : widget.peraturanPopuler.judul!.length >=
                                            201 &&
                                        widget.peraturanPopuler.judul!.length <=
                                            399
                                    ? 600
                                    : widget.peraturanPopuler.judul!.length >=
                                                101 &&
                                            widget.peraturanPopuler.judul!
                                                    .length <=
                                                200
                                        ? 120
                                        : widget.peraturanPopuler.judul!
                                                        .length >
                                                    30 &&
                                                widget.peraturanPopuler.judul!
                                                        .length <=
                                                    100
                                            ? 100
                                            : widget.peraturanPopuler.judul!
                                                            .length >=
                                                        5 &&
                                                    widget.peraturanPopuler
                                                            .judul!.length <=
                                                        30
                                                ? 90
                                                : 90
                    : 90,
                subtitle: widget.peraturanPopuler.judul ?? ''),

            widget.peraturanPopuler.teuBadan != null
                ? InfoDetailWidget(
                    title: "T.E.U Badan/Pengarang",
                    subtitle: widget.peraturanPopuler.teuBadan
                        .toString()
                        .split('.')
                        .last
                        .replaceAll('_', ' '),
                    heightTitle: 80)
                : InfoDetailWidget(
                    title: "T.E.U Badan/Pengarang",
                    subtitle: "-",
                    heightTitle: 80),
            InfoDetailWidget(
              title: "Nomor Peraturan",
              subtitle: widget.peraturanPopuler.nomorPeraturanBaru ?? '-',
              heightTitle: 80,
            ),
            widget.peraturanPopuler.jenis != null
                ? InfoDetailWidget(
                    title: "Jenis Peraturan",
                    subtitle: widget.peraturanPopuler.jenis
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
            widget.peraturanPopuler.singkatanJenis != null
                ? InfoDetailWidget(
                    title: "Singkatan Jenis/Bentuk Peraturan",
                    subtitle: widget.peraturanPopuler.singkatanJenis
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
            widget.peraturanPopuler.tempatTerbit != null
                ? InfoDetailWidget(
                    title: "Tempat Penetapan",
                    subtitle: widget.peraturanPopuler.tempatTerbit
                        .toString()
                        .split('.')
                        .last,
                    heightTitle: 80,
                  )
                : InfoDetailWidget(
                    title: "Tempat Penetapan",
                    subtitle: '-',
                    heightTitle: 80,
                  ),
            //"${widget.peraturanHukum.tanggal}"
            //subtitle: convertedDate ?? '-',
            widget.peraturanPopuler.tglPenetapan == null
                ? InfoDetailWidget(
                    title: "Tanggal-bulan-tahun Penetapan",
                    subtitle: "-",
                    heightTitle: 80,
                  )
                : InfoDetailWidget(
                    title: "Tanggal-bulan-tahun Penetapan",
                    subtitle: DateFormat('dd-MM-yyyy').format(DateTime.parse(
                        '${widget.peraturanPopuler.tglPenetapan}')),
                    heightTitle: 80,
                  ),
            //subtitle: convertedDateUndang ?? '-',
            widget.peraturanPopuler.tanggalPengundangan == null
                ? InfoDetailWidget(
                    title: "Tanggal-bulan-tahun Pengundangan",
                    subtitle: "-",
                  )
                : InfoDetailWidget(
                    title: "Tanggal-bulan-tahun Pengundangan",
                    subtitle: DateFormat('dd-MM-yyyy').format(DateTime.parse(
                        '${widget.peraturanPopuler.tanggalPengundangan}')),
                  ),
            widget.peraturanPopuler.sumber == null
                ? InfoDetailWidget(
                    title: "Sumber",
                    subtitle: "-",
                    heightTitle: 80,
                  )
                : InfoDetailWidget(
                    title: "Sumber",
                    subtitle: widget.peraturanPopuler.sumber
                                .toString()
                                .split('.')
                                .last ==
                            'EMPTY'
                        ? '-'
                        : widget.peraturanPopuler.sumber
                            .toString()
                            .split('.')
                            .last,
                    heightTitle: 80,
                  ),
            InfoDetailWidget(
              title: "Subjek",
              subtitle:
                  widget.peraturanPopuler.subjek?[0].replaceAll('-', ' ') ??
                      '-',
              heightTitle: widget.peraturanPopuler.subjek?[0] != '-' ? 90 : 80,
            ),
            InfoDetailWidget(
                title: "Status",
                subtitle: "${widget.peraturanPopuler.status ?? '-'}"),
            InfoDetailStatusPeraturanWidget(
                title: "Detail Status Peraturan",
                heightTitle: widget.peraturanPopuler.detailStatusPeraturan![0]
                            .perNoObjek !=
                        null
                    ? widget.peraturanPopuler.detailStatusPeraturan!.length == 1
                        ? 80
                        : widget.peraturanPopuler.detailStatusPeraturan!
                                        .length >
                                    1 &&
                                widget.peraturanPopuler.detailStatusPeraturan!
                                        .length <=
                                    3
                            ? 120
                            : widget.peraturanPopuler.detailStatusPeraturan!
                                            .length <=
                                        5 &&
                                    widget.peraturanPopuler
                                            .detailStatusPeraturan!.length >
                                        3
                                ? 140
                                : 190 //240
                    : 80, //ini kalau detailnya enggak ada
                subWidget: Column(
                  children: widget.peraturanPopuler.detailStatusPeraturan![0]
                              .detailNamaStatus !=
                          null
                      ? buildListItems()
                      : [Text("-")],
                  // children: [
                  //   _buildListItems(),
                  //   // Text(
                  //   //   "${widget.peraturanPopuler.detailStatusPeraturan![0].detailNamaStatus.toString().split('.').last} ${widget.peraturanPopuler.detailStatusPeraturan![0].perNoObjek}",
                  //   //   style: TextStyle(
                  //   //     fontSize: 13.0,
                  //   //   ),
                  //   // ),
                  // ],
                )),

            // InfoDetailWidget(
            //   title: "Detail Status Peraturan",
            //   subtitle: widget.peraturanPopuler.detailStatusPeraturan!.isEmpty
            //       ? "-"
            //       : "Baru",
            //   heightTitle: 80,
            // ),
            widget.peraturanPopuler.tempatTerbit == null
                ? const InfoDetailWidget(
                    title: "Lokasi",
                    subtitle: '-',
                    heightTitle: 80,
                  )
                : InfoDetailWidget(
                    title: "Lokasi",
                    subtitle: widget.peraturanPopuler.tempatTerbit
                        .toString()
                        .split('.')
                        .last,
                    heightTitle: 80,
                  ),
            widget.peraturanPopuler.bidangHukum != null
                ? InfoDetailWidget(
                    title: "Bidang Hukum",
                    subtitle: widget.peraturanPopuler.bidangHukum
                        .toString()
                        .split('.')
                        .last
                        .replaceAll('_', ' '),
                    heightTitle: 80,
                  )
                : const InfoDetailWidget(
                    title: "Bidang Hukum",
                    subtitle: '-',
                    heightTitle: 80,
                  ),
            InfoDetailWidget(
              title: "Lampiran",
              subtitle: widget.peraturanPopuler.fileLampiran ?? "-",
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
                      widget.peraturanPopuler.urlDetailPeraturan ?? "-";

                  //masukkin kata katanya di tanda kutip
                  await Share.share(urlLink);

                  print("${widget.peraturanPopuler.urlDetailPeraturan}");
                },
              ),
            ),
            widget.peraturanPopuler.urlDownload ==
                    "https://jdihstage.bumn.go.id/storage/peraturanPopuler/"
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

                              print("${widget.peraturanPopuler.urlDownload}");

                              await checkPermission();

                              await FileDownloader.downloadFile(
                                url: "${widget.peraturanPopuler.urlDownload}",
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
                                  ScaffoldMessenger.of(context).showSnackBar(
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
                                          print(
                                              '${path.replaceAll('%', ' ').replaceAll('20', '')}');
                                          await OpenFilex.open(
                                                  '${path.replaceAll('%', ' ').replaceAll('20', '')}')
                                              .then((value) {
                                            print(value.message.toString());
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
      ),
    );
  }
}
