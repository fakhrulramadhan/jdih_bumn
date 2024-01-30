// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class FaqWidget extends StatefulWidget {
  const FaqWidget({Key? key}) : super(key: key);

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  bool _customTileExpanded = false;
  bool _customTileExpandedtwo = false;
  bool _customTileExpandedThree = false;
  bool _customTileExpandedFour = false;
  bool _customTileExpandedFive = false;
  bool _customTileExpandedSix = false;
  bool _customTileExpandedSeven = false;
  bool _customTileExpandedEight = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Scrollbar(
            thumbVisibility: true,
            controller: _scrollController,
            thickness: 10,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: const Text(
                        "Apa itu JDIH Kementerian BUMN?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        _customTileExpanded
                            ? Icons.south_east_outlined
                            : Icons.north_east_outlined,
                        color: Colors.black,
                      ),
                      // merubah UI arahnya
                      onExpansionChanged: (bool expanded) {
                        // jika exp tilenya diklik maka icon arrownya akan berubah
                        setState(() {
                          _customTileExpanded = expanded;
                        });
                      },
                      children: const [
                        ListTile(
                          title: Text(
                            "JDIH Kementerian BUMN adalah wadah pendayagunaan bersama atas dokumen hukum terkait Kementerian Badan Usaha Milik Negara, Badan Usaha Milik Negara dan dokumen hukum lainnya yang dikelola secara tertib, terpadu dan berkesinambungan, serta merupakan sarana pemberian pelayanan informasi hukum secara lengkap, akurat, mudah, dan cepat.",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text(
                        "Bagaimana cara menemukan produk hukum yang diinginkan?",
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        _customTileExpandedtwo
                            ? Icons.south_east_outlined
                            : Icons.north_east_outlined,
                        color: Colors.black,
                      ),
                      onExpansionChanged: (bool expandedtwo) {
                        setState(() {
                          _customTileExpandedtwo = expandedtwo;
                        });
                      },
                      children: const [
                        ListTile(
                          title: Text(
                            "Untuk mencari produk hukum yang Anda inginkan, Anda dapat memasukkan kata kunci seperti jenis, nomor atau tentang peraturan yang anda ketahui pada tab pencarian, kemudian klik tombol cari.",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text(
                        "Bagaimana Jika produk hukum tidak ada di website BUMN",
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        _customTileExpandedThree
                            ? Icons.south_east_outlined
                            : Icons.north_east_outlined,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      onExpansionChanged: (bool expandedthree) {
                        setState(() {
                          _customTileExpandedThree = expandedthree;
                        });
                      },
                      children: const [
                        ListTile(
                          title: Text(
                            "Silahkan meninggalkan pesan/komentar melalui menu Tanya Hukum BUMN yang terletak pada pojok kanan bawah. Jangan lupa untuk menginformasikan alamat ,email Anda yang valid agar kami bisa menghubungi anda.",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text(
                        "Bagaimana cara mengunduh file produk hukum?",
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        _customTileExpandedFour
                            ? Icons.south_east_outlined
                            : Icons.north_east_outlined,
                        color: Colors.black,
                      ),
                      onExpansionChanged: (bool expandedfour) {
                        setState(() {
                          _customTileExpandedFour = expandedfour;
                        });
                      },
                      children: const [
                        ListTile(
                          title: Text(
                            "Untuk mengunduh dokumen hukum, Anda dapat mengklik pilihan Unduh yang terletak di atas deskripsi produk hukum.",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text(
                        "Pelayanan apa saja yang disediakan JDIH Kementerian BUMN untuk umum?",
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        _customTileExpandedFive
                            ? Icons.south_east_outlined
                            : Icons.north_east_outlined,
                        color: Colors.black,
                      ),
                      onExpansionChanged: (bool expandedFive) {
                        setState(() {
                          _customTileExpandedFive = expandedFive;
                        });
                      },
                      children: const [
                        ListTile(
                          title: Text(
                            "JDIH Kementerian BUMN memberikan pelayanan kepada masyarakat umum diantaranya adalah penyediaan koleksi regulasi yang ada dapat dibaca dan/atau diunduh serta penyediaan dokumen hukum lainnya.",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text(
                        "Mengapa Keputusan Menteri BUMN tidak lengkap di website ini?",
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        _customTileExpandedSix
                            ? Icons.south_east_outlined
                            : Icons.north_east_outlined,
                        color: Colors.black,
                      ),
                      onExpansionChanged: (bool expandedSix) {
                        setState(() {
                          _customTileExpandedSix = expandedSix;
                        });
                      },
                      children: const [
                        ListTile(
                          title: Text(
                            "Sebagian besar Keputusan Menteri BUMN merupakan produk hukum yang bersifat menetapkan (beschikking) dan hanya ditujukan dan disampaikan kepada para penerima salinan yang tercantum dalam Keputusan Menteri BUMN tersebut.",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text(
                        "Apakah konten yang tersedia di website ini sama dengan yang ada di aplikasi JDIH Mobile?",
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        _customTileExpandedSeven
                            ? Icons.south_east_outlined
                            : Icons.north_east_outlined,
                        color: Colors.black,
                      ),
                      onExpansionChanged: (bool expandedSeven) {
                        //update ui arrow
                        setState(() {
                          _customTileExpandedSeven = expandedSeven;
                        });
                      },
                      children: const [
                        ListTile(
                          title: Text(
                            "Ya, konten yang tersedia di website ini sama dengan yang ada di aplikasi JDIH Mobile.",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text(
                        "Bagaimana cara menyampaikan saran-saran atau kritik untuk website ini?",
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        _customTileExpandedEight
                            ? Icons.south_east_outlined
                            : Icons.north_east_outlined,
                        color: Colors.black,
                      ),
                      onExpansionChanged: (bool expandedeight) {
                        setState(() {
                          _customTileExpandedEight = expandedeight;
                        });
                      },
                      children: const [
                        ListTile(
                          title: Text(
                            "Anda dapat menyampaikan kritik atau saran untuk website JDIH Kementerian BUMN melalui email jdih.kbumn@bumn.go.id.",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SvgPicture.asset(
                      "assets/images/BUMN Background.svg",
                      height: 153,
                      width: MediaQuery.of(context).size.width * 0.8,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Maaf, tidak bisa ke halaman sebelumnya'),
              backgroundColor: Colors.red,
            ),
          );
          return false;
        });
  }
}
