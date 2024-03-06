import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jdih_bumn/bloc/stage/search_putusan/search_putusan_bloc.dart';
import 'package:jdih_bumn/bloc/stage/search_putusan_freezed/search_putusan_freezed_bloc.dart';
import 'package:jdih_bumn/data/model/response/stage/putusan_response_model.dart';

import 'package:jdih_bumn/presentation/putusan/widget/list_putusan_widget.dart';
import 'package:jdih_bumn/presentation/putusan_detail/putusan_detail_screen.dart';

class PutusanSearchScreen extends StatefulWidget {
  //final String keyword;
  const PutusanSearchScreen({super.key});

  @override
  State<PutusanSearchScreen> createState() => _PutusanSearchScreenState();
}

class _PutusanSearchScreenState extends State<PutusanSearchScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final TextEditingController searchController = TextEditingController();

    @override
    void initState() {
      // TODO: implement initState
      //searchController.text = widget.keyword;

      context
          .read<SearchPutusanFreezedBloc>()
          .add(SearchPutusanFreezedEvent.search(''));
      super.initState();
    }

    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 90,
      //   leading: const BackButton(
      //     color: Colors.white,
      //   ),
      //   actions: const [],
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //         image: DecorationImage(
      //       image: AssetImage(
      //         'assets/images/appbar-bg2.png',
      //       ),
      //       fit: BoxFit.fill,
      //     )),
      //     child: const Center(
      //       child: Text(
      //         "Peraturan",
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset(
            "assets/images/appbar-bg2.png",
            width: width,
            height: 110.0,
            fit: BoxFit.none,
          ),
          SingleChildScrollView(
            controller: ScrollController(),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 0.195 * MediaQuery.of(context).size.width,
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 90,
                          width: 195,
                          child: Center(
                            child: Text(
                              "Putusan",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Container(
                            height: 45,
                            width: width * 0.9,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24))),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: 3,
                              child: TextFormField(
                                controller: searchController,
                                onFieldSubmitted: (value) {
                                  ListPutusanWidgetState.instance
                                      .updateSearch(value);
                                },
                                decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      // onTap: () {
                                      //   context.read<SearchPutusanBloc>().add(
                                      //       DoSearchPutusanEvent(
                                      //           keyword:
                                      //               searchController.text));
                                      //   print(searchController.text);
                                      // },
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 6),
                                        child: Icon(
                                          Icons.search,
                                          size: 24.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(7),
                                        ),
                                        borderSide: BorderSide.none),
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            color: Colors.black38, width: 1)),
                                    hintText: 'Ketik kata kunci pencarian....',
                                    hintStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        //const ListPutusanWidget(),
                        BlocBuilder<SearchPutusanFreezedBloc,
                            SearchPutusanFreezedState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return Center(
                                  child: Text("Tidak Ditemukan Data"),
                                );
                              },
                              loaded: (data) {
                                return ListView.builder(
                                  itemCount: data.items!.length,
                                  //physics: const ScrollPhysics(),
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, index) {
                                    final Item putusan = data.items![index];

                                    print(
                                        "ini jumlah datanya ${data.items!.length}");

                                    var parsedDate = DateTime.parse(
                                        '${putusan.tglPenetapan}');

                                    String tglPenetapan =
                                        DateFormat("dd-MM-yyyy")
                                            .format(parsedDate);

                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return PutusanDetailScreen(
                                              putusan: putusan,
                                            );
                                          }),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            //195 : 150 + 20 utk sizedbox
                                            height: putusan.judul!.length >= 100
                                                ? 215
                                                : 165,
                                            //height: 215,
                                            width: 361,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey,
                                                      spreadRadius: 2,
                                                      offset: Offset(3, 3),
                                                      blurRadius: 2)
                                                ],
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12),
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12))),
                                            child: Column(
                                              children: [
                                                Container(
                                                  //height: 185,
                                                  height:
                                                      putusan.judul!.length >=
                                                              100
                                                          ? 185
                                                          : 135,
                                                  width: 361,
                                                  //color: Colors.brown,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(12),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          12))),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        // height: putusan.judul!.length >= 100 ? 165 : 120,
                                                        height: 165,
                                                        width: 341,
                                                        //color: Colors.yellow,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20),
                                                        decoration: const BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12))),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "${putusan.nomorPerkara}",
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color(
                                                                    0xFF0093AD),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                            const SizedBox(
                                                              height: 8.0,
                                                            ),
                                                            Text(
                                                              "${putusan.nomorPutusan}",
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                            ),
                                                            const SizedBox(
                                                              height: 8.0,
                                                            ),
                                                            Text(
                                                              "${putusan.judul}",
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 390,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  decoration: const BoxDecoration(
                                                      color: Color(0xFFECF0F1),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(12),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          12))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 170,
                                                        height: 30,
                                                        decoration: const BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12))),
                                                        child: Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              size: 8.0,
                                                            ),
                                                            const SizedBox(
                                                              width: 2.0,
                                                            ),
                                                            Text(
                                                              tglPenetapan,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 9.0,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 4.0,
                                                            ),
                                                            // const Icon(
                                                            //   Icons.remove_red_eye,
                                                            //   size: 8.0,
                                                            // ),
                                                            // const SizedBox(
                                                            //   width: 2.0,
                                                            // ),
                                                            // Text(
                                                            //   "30000",
                                                            //   style: const TextStyle(
                                                            //     fontSize: 9.0,
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // const SizedBox(
                                                //   height: 20.0,
                                                // ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              loading: () {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
