// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/material/refresh_indicator.dart' as refresh;
// import 'package:intl/intl.dart';
// import 'package:jdih_bumn/constants/constants.dart';
// import 'package:jdih_bumn/presentation/peraturan/widget/list_peraturan_paging/list_peraturan_paging_widget.dart';
// import 'package:jdih_bumn/presentation/peraturan/widget/list_peraturan_paging/list_peraturan_pagings_widget.dart';
// import 'package:jdih_bumn/presentation/peraturan/widget/list_peraturan_paging/list_peraturan_refresh.dart';
// import 'package:jdih_bumn/presentation/peraturan/widget/list_peraturan_widget.dart';
// import 'package:http/http.dart' as http;
// import 'package:jdih_bumn/data/model/response/stage/peraturan_response_model.dart';
// import 'package:jdih_bumn/presentation/peraturan_detail/peraturan_detail_screen.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class PeraturanSearchScreen extends StatefulWidget {
//   //final String keyword;

//   //const PeraturanSearchScreen({super.key, required this.keyword});

//   const PeraturanSearchScreen({super.key});
//   @override
//   State<PeraturanSearchScreen> createState() => _PeraturanSearchScreenState();
// }

// class _PeraturanSearchScreenState extends State<PeraturanSearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     final TextEditingController searchController = TextEditingController();

//     final GlobalKey<refresh.RefreshIndicatorState> _refreshIndicatorKey =
//         GlobalKey<refresh.RefreshIndicatorState>();

//     int currentPage = 1;

//     //String? keyword;

//     int totalPages = 30;

//     List<Item> peraturan = [];

//     final RefreshController refreshController =
//         RefreshController(initialRefresh: true);

//     //{bool isRefresh = false, String keyword = ''}
//     Future<bool> getPeraturanData(
//         {bool isRefresh = false, String keyword = ''}) async {
//       if (isRefresh) {
//         currentPage = 1;
//       } else {
//         if (currentPage >= totalPages) {
//           refreshController.loadNoData();
//           return false;
//         }
//       }

//       final response = await http.get(Uri.parse(
//           '${Constants.baseUrlStage}/produk-hukum/produk/peraturan?page=$currentPage&keyword=$keyword'));

//       if (response.statusCode == 200) {
//         final result = peraturanResponseModelFromJson(response.body);

//         // final result =
//         //     PeraturanResponseModel.fromJson(jsonDecode(response.body));

//         if (isRefresh) {
//           peraturan = result.items!;
//         } else {
//           peraturan.addAll(result.items!);
//         }

//         currentPage++;

//         //totalPages = result.totalPages;

//         print(response.body);
//         setState(() {});
//         return true;
//       } else {
//         return false;
//       }
//     }

//     @override
//     void initState() async {
//       //context.read<GetPeraturanHukumBloc>().add(DoGetPeraturanHukumEvent());
//       // TODO: implement initState
//       //searchController.text = keyword;
//       //await getPeraturanData();
//       super.initState();
//     }

//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Image.asset(
//               "assets/images/appbar-bg2.png",
//               width: width,
//               height: 110.0,
//               fit: BoxFit.none,
//             ),
//             ListView(
//                 controller: ScrollController(),
//                 physics: const BouncingScrollPhysics(),
//                 scrollDirection: Axis.vertical,
//                 children: [
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             BackButton(
//                               color: Colors.white,
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                             ),
//                             SizedBox(
//                               width: 0.195 * MediaQuery.of(context).size.width,
//                             ),
//                             const Expanded(
//                               child: SizedBox(
//                                 height: 90,
//                                 width: 195,
//                                 child: Center(
//                                   child: Text(
//                                     "Peraturan",
//                                     style: TextStyle(
//                                       fontSize: 20.0,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(child: Container()),
//                           ],
//                         ),
//                         Container(
//                           //height: 630,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: const BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(24),
//                                   topRight: Radius.circular(24))),
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             children: [
//                               const SizedBox(
//                                 height: 10.0,
//                               ),
//                               Center(
//                                 child: SizedBox(
//                                   height: 45,
//                                   width: width * 0.9,
//                                   child: Material(
//                                     borderRadius: BorderRadius.circular(10),
//                                     elevation: 3,
//                                     child: TextFormField(
//                                       controller: searchController,
//                                       onFieldSubmitted: (value) async {
//                                         await getPeraturanData(
//                                             isRefresh: true, keyword: value);
//                                         print(value);
//                                       },
//                                       decoration: InputDecoration(
//                                           suffixIcon: InkWell(
//                                             onTap: () {},
//                                             child: const Padding(
//                                               padding: EdgeInsets.only(left: 6),
//                                               child: Icon(
//                                                 Icons.search,
//                                                 size: 24.0,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ),
//                                           filled: true,
//                                           fillColor: Colors.white,
//                                           contentPadding: const EdgeInsets.only(
//                                               top: 10, left: 20, right: 20),
//                                           border: const OutlineInputBorder(
//                                               borderRadius: BorderRadius.all(
//                                                 Radius.circular(7),
//                                               ),
//                                               borderSide: BorderSide.none),
//                                           enabledBorder:
//                                               const OutlineInputBorder(
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                           Radius.circular(10)),
//                                                   borderSide: BorderSide(
//                                                       color: Colors.black38,
//                                                       width: 1)),
//                                           hintText:
//                                               'Ketik kata kunci pencarian....',
//                                           hintStyle: const TextStyle(
//                                             fontWeight: FontWeight.w400,
//                                             fontSize: 14.0,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 20.0,
//                               ),
//                               //const ListPeraturanWidget(),
//                               //pakai bloc builder search
//                               Container(
//                                   height: 900,
//                                   width: MediaQuery.of(context).size.width,
//                                   child: SmartRefresher(
//                                     controller: refreshController,
//                                     enablePullUp: true,
//                                     onRefresh: () async {
//                                       final result = await getPeraturanData(
//                                           isRefresh: true);

//                                       if (result) {
//                                         refreshController.refreshCompleted();
//                                       } else {
//                                         refreshController.refreshFailed();
//                                       }
//                                     },
//                                     onLoading: () async {
//                                       final result = await getPeraturanData();

//                                       if (result) {
//                                         refreshController.loadComplete();
//                                       } else {
//                                         refreshController.loadFailed();
//                                       }
//                                     },
//                                     child: ListView.builder(
//                                         physics:
//                                             const AlwaysScrollableScrollPhysics(),
//                                         //physics: BouncingScrollPhysics(),
//                                         shrinkWrap: true,
//                                         scrollDirection: Axis.vertical,
//                                         itemBuilder: (context, index) {
//                                           final peraturanindex =
//                                               peraturan[index];

//                                           var parsedDate = DateTime.parse(
//                                               '${peraturanindex.createdAt}');

//                                           String convertedDate =
//                                               DateFormat("dd-MM-yyyy")
//                                                   .format(parsedDate);
//                                           print("peraturanIndex");
//                                           print(peraturanindex);
//                                           return InkWell(
//                                             onTap: () {
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) {
//                                                   return PeraturanDetailScreen(
//                                                       peraturan:
//                                                           peraturanindex);
//                                                 }),
//                                               );
//                                             },
//                                             // length = panjang karakter
//                                             child: Container(
//                                               // height: peraturan.judul!.length >= 100
//                                               //     ? 240
//                                               //     : peraturan.judul!.length >= 50 &&
//                                               //             peraturan.judul!.length < 100
//                                               //         ? 190
//                                               //         : 190,
//                                               width: 361,
//                                               padding: const EdgeInsets.all(5),
//                                               child: Column(
//                                                 children: [
//                                                   Container(
//                                                     // height: peraturan.judul!.length >= 100
//                                                     //     ? 210
//                                                     //     : peraturan.judul!.length >= 50 &&
//                                                     //             peraturan.judul!.length < 100
//                                                     //         ? 170
//                                                     //         : 170,
//                                                     width: 361,
//                                                     decoration:
//                                                         const BoxDecoration(
//                                                             color: Colors.white,
//                                                             boxShadow: [
//                                                               BoxShadow(
//                                                                   color: Colors
//                                                                       .grey,
//                                                                   spreadRadius:
//                                                                       2,
//                                                                   offset:
//                                                                       Offset(
//                                                                           0, 0),
//                                                                   blurRadius: 2)
//                                                             ],
//                                                             borderRadius: BorderRadius.only(
//                                                                 topLeft: Radius
//                                                                     .circular(
//                                                                         12),
//                                                                 topRight: Radius
//                                                                     .circular(
//                                                                         12),
//                                                                 bottomLeft: Radius
//                                                                     .circular(
//                                                                         12),
//                                                                 bottomRight: Radius
//                                                                     .circular(
//                                                                         12))),
//                                                     child: Column(
//                                                       children: [
//                                                         Container(
//                                                           // height: peraturan.judul!.length >= 100
//                                                           //     ? 180
//                                                           //     : peraturan.judul!.length >= 50 &&
//                                                           //             peraturan.judul!.length < 100
//                                                           //         ? 140
//                                                           //         : 140,
//                                                           width: 361,
//                                                           //color: Colors.brown,
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .only(
//                                                                   left: 10,
//                                                                   bottom: 10),
//                                                           child: Stack(
//                                                             children: [
//                                                               Container(
//                                                                 // height: peraturan.judul!.length >= 435
//                                                                 //     ? 180
//                                                                 //     : peraturan.judul!.length >= 100 &&
//                                                                 //             peraturan.judul!.length < 435
//                                                                 //         ? 180
//                                                                 //         : peraturan.judul!.length >= 50 &&
//                                                                 //                 peraturan.judul!.length <
//                                                                 //                     100
//                                                                 //             ? 140
//                                                                 //             : 140,
//                                                                 width: 341,
//                                                                 //color: Colors.yellow,
//                                                                 padding:
//                                                                     const EdgeInsets
//                                                                         .all(
//                                                                         20),
//                                                                 decoration: const BoxDecoration(
//                                                                     color: Colors
//                                                                         .white,
//                                                                     borderRadius: BorderRadius.only(
//                                                                         topLeft:
//                                                                             Radius.circular(
//                                                                                 12),
//                                                                         topRight:
//                                                                             Radius.circular(
//                                                                                 12),
//                                                                         bottomLeft:
//                                                                             Radius.circular(
//                                                                                 12),
//                                                                         bottomRight:
//                                                                             Radius.circular(12))),
//                                                                 child: Column(
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .start,
//                                                                   children: [
//                                                                     Text(
//                                                                       peraturanindex
//                                                                               .perNoBaru ??
//                                                                           '-',
//                                                                       style:
//                                                                           const TextStyle(
//                                                                         fontSize:
//                                                                             14.0,
//                                                                         fontWeight:
//                                                                             FontWeight.w600,
//                                                                         color: Color(
//                                                                             0xFF0093AD),
//                                                                       ),
//                                                                       textAlign:
//                                                                           TextAlign
//                                                                               .left,
//                                                                       overflow:
//                                                                           TextOverflow
//                                                                               .fade,
//                                                                     ),
//                                                                     const SizedBox(
//                                                                       height:
//                                                                           8.0,
//                                                                     ),
//                                                                     Text(
//                                                                       peraturanindex
//                                                                               .nomorPeraturanBaru ??
//                                                                           '',
//                                                                       style:
//                                                                           const TextStyle(
//                                                                         fontSize:
//                                                                             12.0,
//                                                                         fontWeight:
//                                                                             FontWeight.w300,
//                                                                         color: Colors
//                                                                             .black,
//                                                                       ),
//                                                                       textAlign:
//                                                                           TextAlign
//                                                                               .left,
//                                                                     ),
//                                                                     const SizedBox(
//                                                                       height:
//                                                                           8.0,
//                                                                     ),
//                                                                     Text(
//                                                                       peraturanindex
//                                                                               .deskripsiTentang ??
//                                                                           '',
//                                                                       style:
//                                                                           const TextStyle(
//                                                                         fontSize:
//                                                                             12.0,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                         color: Colors
//                                                                             .black,
//                                                                       ),
//                                                                       textAlign:
//                                                                           TextAlign
//                                                                               .left,
//                                                                       overflow:
//                                                                           TextOverflow
//                                                                               .fade,
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                               Positioned(
//                                                                 top: -75,
//                                                                 right: -145,
//                                                                 child:
//                                                                     Container(
//                                                                   height: 180,
//                                                                   width: 361,
//                                                                   color: Colors
//                                                                       .transparent,
//                                                                   child: Align(
//                                                                     alignment:
//                                                                         Alignment
//                                                                             .center,
//                                                                     child:
//                                                                         Container(
//                                                                       height:
//                                                                           37,
//                                                                       width: 80,
//                                                                       decoration:
//                                                                           const BoxDecoration(
//                                                                         borderRadius: BorderRadius.only(
//                                                                             topLeft:
//                                                                                 Radius.circular(0),
//                                                                             bottomLeft: Radius.circular(20),
//                                                                             bottomRight: Radius.circular(0),
//                                                                             topRight: Radius.circular(20)),
//                                                                         color: Color(
//                                                                             0xFF0093AD),
//                                                                       ),
//                                                                       child:
//                                                                           const Center(
//                                                                         child:
//                                                                             Text(
//                                                                           "Berlaku",
//                                                                           style:
//                                                                               TextStyle(
//                                                                             fontSize:
//                                                                                 9.0,
//                                                                             color:
//                                                                                 Colors.white,
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               )
//                                                             ],
//                                                           ),
//                                                         ),
//                                                         Container(
//                                                           height: 30,
//                                                           width: MediaQuery.of(
//                                                                   context)
//                                                               .size
//                                                               .width,
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .only(
//                                                                   left: 20),
//                                                           decoration: const BoxDecoration(
//                                                               color: Color(
//                                                                   0xFFECF0F1),
//                                                               borderRadius: BorderRadius.only(
//                                                                   bottomLeft: Radius
//                                                                       .circular(
//                                                                           12),
//                                                                   bottomRight: Radius
//                                                                       .circular(
//                                                                           12))),
//                                                           child: Row(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               SizedBox(
//                                                                 width: 0.38 *
//                                                                     MediaQuery.of(
//                                                                             context)
//                                                                         .size
//                                                                         .width,
//                                                                 child: Row(
//                                                                   children: [
//                                                                     const Icon(
//                                                                       Icons
//                                                                           .calendar_month,
//                                                                       size: 8.0,
//                                                                     ),
//                                                                     const SizedBox(
//                                                                       width:
//                                                                           2.0,
//                                                                     ),
//                                                                     Text(
//                                                                       convertedDate,
//                                                                       style:
//                                                                           const TextStyle(
//                                                                         fontSize:
//                                                                             9.0,
//                                                                         color: Colors
//                                                                             .black,
//                                                                       ),
//                                                                     ),
//                                                                     const SizedBox(
//                                                                       width:
//                                                                           4.0,
//                                                                     ),
//                                                                     const Icon(
//                                                                       Icons
//                                                                           .remove_red_eye,
//                                                                       size: 8.0,
//                                                                     ),
//                                                                     const SizedBox(
//                                                                       width:
//                                                                           2.0,
//                                                                     ),
//                                                                     Text(
//                                                                       "${peraturanindex.countReader}",
//                                                                       style:
//                                                                           const TextStyle(
//                                                                         fontSize:
//                                                                             9.0,
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                               SizedBox(
//                                                                 width: 0.14 *
//                                                                     MediaQuery.of(
//                                                                             context)
//                                                                         .size
//                                                                         .width,
//                                                               ),
//                                                               const Icon(
//                                                                 Icons
//                                                                     .picture_as_pdf,
//                                                                 size: 9.0,
//                                                                 color:
//                                                                     Colors.red,
//                                                               ),
//                                                               const SizedBox(
//                                                                 width: 2.0,
//                                                               ),
//                                                               const Text(
//                                                                 "Full Teks",
//                                                                 style:
//                                                                     TextStyle(
//                                                                   fontSize: 9.0,
//                                                                   color: Colors
//                                                                       .red,
//                                                                 ),
//                                                               ),
//                                                               const SizedBox(
//                                                                 width: 8.0,
//                                                               ),
//                                                               const Icon(
//                                                                 Icons.list,
//                                                                 size: 9.0,
//                                                                 color: Color(
//                                                                     0xFF0093AD),
//                                                               ),
//                                                               const SizedBox(
//                                                                 width: 2.0,
//                                                               ),
//                                                               const Text(
//                                                                 "Rincian",
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         8.0,
//                                                                     color: Color(
//                                                                         0xFF0093AD)),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 2.0,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                         itemCount: peraturan.length),
//                                   ))

//                               //ListPeraturanPagingsWidget(),
//                               // Container(
//                               //     height: double.infinity,
//                               //     width: MediaQuery.of(context).size.width,
//                               //     child: ListPeraturanPagingsWidget())
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ]),
//           ],
//         ),
//       ),
//     );
//   }
// }
