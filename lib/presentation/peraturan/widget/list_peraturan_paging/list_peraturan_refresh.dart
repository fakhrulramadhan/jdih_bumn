import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:jdih_bumn/constants/constants.dart';
import 'package:jdih_bumn/presentation/peraturan/widget/pdf_screen.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/peraturan_detail_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturans_response_model.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ListPeraturanRefresh extends StatefulWidget {
  const ListPeraturanRefresh({super.key});

  @override
  State<ListPeraturanRefresh> createState() => ListPeraturanRefreshState();
}

class ListPeraturanRefreshState extends State<ListPeraturanRefresh> {
  static late ListPeraturanRefreshState instance;

  int currentPage = 1;

  String search = '';

  int totalPages = 30;

  List<Item> peraturan = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  updateSearch(String value) async {
    search = value;

    getPeraturanData(isRefresh: true);
  }

  Future<bool> getPeraturanData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }

    print(currentPage);

    final response = await http.get(Uri.parse(
        '${Constants.baseUrlStage}/produk-hukum/produk/peraturan?page=$currentPage&keyword=$search'));

    if (response.statusCode == 200) {
      final result = peraturansResponseModelFromJson(response.body);

      if (isRefresh) {
        peraturan = result.items!;
      } else {
        peraturan.addAll(result.items!);
      }

      currentPage++;

      //totalPages = result.totalPages;

      print(response.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    instance = this;
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      onRefresh: () async {
        final result = await getPeraturanData(isRefresh: true);

        if (result) {
          refreshController.refreshCompleted();
        } else {
          refreshController.refreshFailed();
        }
      },
      onLoading: () async {
        final result = await getPeraturanData();

        if (result) {
          refreshController.loadComplete();
        } else {
          refreshController.loadFailed();
        }
      },
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          //physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final peraturanindex = peraturan[index];

            var parsedDate = DateTime.parse('${peraturanindex.createdAt}');

            String convertedDate = DateFormat("dd-MM-yyyy").format(parsedDate);
            print("peraturanIndex");
            print(peraturanindex);
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PeraturanDetailScreen(peraturan: peraturanindex);
                  }),
                );
              },
              // length = panjang karakter
              child: Container(
                // height: peraturan.judul!.length >= 100
                //     ? 240
                //     : peraturan.judul!.length >= 50 &&
                //             peraturan.judul!.length < 100
                //         ? 190
                //         : 190,
                width: 361,
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      // height: peraturan.judul!.length >= 100
                      //     ? 210
                      //     : peraturan.judul!.length >= 50 &&
                      //             peraturan.judul!.length < 100
                      //         ? 170
                      //         : 170,
                      width: 361,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                offset: Offset(0, 0),
                                blurRadius: 2)
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Column(
                        children: [
                          Container(
                            // height: peraturan.judul!.length >= 100
                            //     ? 180
                            //     : peraturan.judul!.length >= 50 &&
                            //             peraturan.judul!.length < 100
                            //         ? 140
                            //         : 140,
                            width: 361,
                            //color: Colors.brown,
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            child: Stack(
                              children: [
                                Container(
                                  // height: peraturan.judul!.length >= 435
                                  //     ? 180
                                  //     : peraturan.judul!.length >= 100 &&
                                  //             peraturan.judul!.length < 435
                                  //         ? 180
                                  //         : peraturan.judul!.length >= 50 &&
                                  //                 peraturan.judul!.length <
                                  //                     100
                                  //             ? 140
                                  //             : 140,
                                  width: 341,
                                  //color: Colors.yellow,
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        peraturanindex.jenis ?? '-',
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF0093AD),
                                        ),
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.fade,
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        peraturanindex.nomorPeraturanBaru ?? '',
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        peraturanindex.deskripsiTentang ?? '',
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -75,
                                  right: -145,
                                  child: Container(
                                    height: 180,
                                    width: 361,
                                    color: Colors.transparent,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 37,
                                        width: 80,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(0),
                                              topRight: Radius.circular(20)),
                                          color: Color(0xFF0093AD),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Berlaku",
                                            style: TextStyle(
                                              fontSize: 9.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(left: 20),
                            decoration: const BoxDecoration(
                                color: Color(0xFFECF0F1),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      0.38 * MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        size: 8.0,
                                      ),
                                      const SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(
                                        convertedDate,
                                        style: const TextStyle(
                                          fontSize: 9.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      const Icon(
                                        Icons.remove_red_eye,
                                        size: 8.0,
                                      ),
                                      const SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(
                                        "${peraturanindex.countReader}",
                                        style: const TextStyle(
                                          fontSize: 9.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      0.14 * MediaQuery.of(context).size.width,
                                ),
                                const Icon(
                                  Icons.picture_as_pdf,
                                  size: 9.0,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 2.0,
                                ),
                                const Text(
                                  "Full Teks",
                                  style: TextStyle(
                                    fontSize: 9.0,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                const Icon(
                                  Icons.list,
                                  size: 9.0,
                                  color: Color(0xFF0093AD),
                                ),
                                const SizedBox(
                                  width: 2.0,
                                ),
                                const Text(
                                  "Rincian",
                                  style: TextStyle(
                                      fontSize: 8.0, color: Color(0xFF0093AD)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: peraturan.length),
    );
  }
}
