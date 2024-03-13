// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:jdih_bumn/cubit/get_page_peraturan/get_page_peraturan_cubit.dart';
// import 'package:jdih_bumn/data/model/response/stage/peraturan_response_model.dart';
// import 'package:jdih_bumn/presentation/peraturan_detail/peraturan_detail_screen.dart';

// class ListPeraturanPagingsWidget extends StatelessWidget {
//   ListPeraturanPagingsWidget({super.key});

//   final scrollController = ScrollController();

//   void setupScrollController(context) {
//     scrollController.addListener(
//       () {
//         if (scrollController.position.atEdge) {
//           if (scrollController.position.pixels != 0) {
//             BlocProvider.of<GetPagePeraturanCubit>(context).loadPeraturanPage();
//           }
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     setupScrollController(context);
//     BlocProvider.of<GetPagePeraturanCubit>(context).loadPeraturanPage();
//     return BlocBuilder<GetPagePeraturanCubit, GetPagePeraturanState>(
//       builder: (context, state) {
//         if (state is GetPagePeraturanLoading && state.isFirstFetch) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         List<Item> peraturans = [];
//         bool isLoading = false;

//         if (state is GetPagePeraturanLoading) {
//           peraturans = state.oldPeraturans;
//           isLoading = true;
//         } else if (state is GetPagePeraturanLoaded) {
//           peraturans = state.peraturans;
//         }

//         return ListView.builder(
//           controller: scrollController,
//           shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           physics: const ScrollPhysics(),
//           itemBuilder: (BuildContext context, index) {
//             if (index < peraturans.length) {
//               var peraturanind = peraturans[index];

//               var parsedDate = DateTime.parse('${peraturanind.createdAt}');

//               String convertedDate =
//                   DateFormat("dd-MM-yyyy").format(parsedDate);
//               return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) {
//                       return PeraturanDetailScreen(peraturan: peraturanind);
//                     }),
//                   );
//                 },
//                 // length = panjang karakter
//                 child: Container(
//                   // height: peraturan.judul!.length >= 100
//                   //     ? 240
//                   //     : peraturan.judul!.length >= 50 &&
//                   //             peraturan.judul!.length < 100
//                   //         ? 190
//                   //         : 190,
//                   width: 361,
//                   padding: const EdgeInsets.all(5),
//                   child: Column(
//                     children: [
//                       Container(
//                         // height: peraturan.judul!.length >= 100
//                         //     ? 210
//                         //     : peraturan.judul!.length >= 50 &&
//                         //             peraturan.judul!.length < 100
//                         //         ? 170
//                         //         : 170,
//                         width: 361,
//                         decoration: const BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.grey,
//                                   spreadRadius: 2,
//                                   offset: Offset(0, 0),
//                                   blurRadius: 2)
//                             ],
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(12),
//                                 topRight: Radius.circular(12),
//                                 bottomLeft: Radius.circular(12),
//                                 bottomRight: Radius.circular(12))),
//                         child: Column(
//                           children: [
//                             Container(
//                               // height: peraturan.judul!.length >= 100
//                               //     ? 180
//                               //     : peraturan.judul!.length >= 50 &&
//                               //             peraturan.judul!.length < 100
//                               //         ? 140
//                               //         : 140,
//                               width: 361,
//                               //color: Colors.brown,
//                               padding:
//                                   const EdgeInsets.only(left: 10, bottom: 10),
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     // height: peraturan.judul!.length >= 435
//                                     //     ? 180
//                                     //     : peraturan.judul!.length >= 100 &&
//                                     //             peraturan.judul!.length < 435
//                                     //         ? 180
//                                     //         : peraturan.judul!.length >= 50 &&
//                                     //                 peraturan.judul!.length <
//                                     //                     100
//                                     //             ? 140
//                                     //             : 140,
//                                     width: 341,
//                                     //color: Colors.yellow,
//                                     padding: const EdgeInsets.all(20),
//                                     decoration: const BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(12),
//                                             topRight: Radius.circular(12),
//                                             bottomLeft: Radius.circular(12),
//                                             bottomRight: Radius.circular(12))),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           peraturanind.perNoBaru ?? '-',
//                                           style: const TextStyle(
//                                             fontSize: 14.0,
//                                             fontWeight: FontWeight.w600,
//                                             color: Color(0xFF0093AD),
//                                           ),
//                                           textAlign: TextAlign.left,
//                                           overflow: TextOverflow.fade,
//                                         ),
//                                         const SizedBox(
//                                           height: 8.0,
//                                         ),
//                                         Text(
//                                           peraturanind.nomorPeraturanBaru ?? '',
//                                           style: const TextStyle(
//                                             fontSize: 12.0,
//                                             fontWeight: FontWeight.w300,
//                                             color: Colors.black,
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         ),
//                                         const SizedBox(
//                                           height: 8.0,
//                                         ),
//                                         Text(
//                                           peraturanind.deskripsiTentang ?? '',
//                                           style: const TextStyle(
//                                             fontSize: 12.0,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.black,
//                                           ),
//                                           textAlign: TextAlign.left,
//                                           overflow: TextOverflow.fade,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: -75,
//                                     right: -145,
//                                     child: Container(
//                                       height: 180,
//                                       width: 361,
//                                       color: Colors.transparent,
//                                       child: Align(
//                                         alignment: Alignment.center,
//                                         child: Container(
//                                           height: 37,
//                                           width: 80,
//                                           decoration: const BoxDecoration(
//                                             borderRadius: BorderRadius.only(
//                                                 topLeft: Radius.circular(0),
//                                                 bottomLeft: Radius.circular(20),
//                                                 bottomRight: Radius.circular(0),
//                                                 topRight: Radius.circular(20)),
//                                             color: Color(0xFF0093AD),
//                                           ),
//                                           child: const Center(
//                                             child: Text(
//                                               "Berlaku",
//                                               style: TextStyle(
//                                                 fontSize: 9.0,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               height: 30,
//                               width: MediaQuery.of(context).size.width,
//                               padding: const EdgeInsets.only(left: 20),
//                               decoration: const BoxDecoration(
//                                   color: Color(0xFFECF0F1),
//                                   borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(12),
//                                       bottomRight: Radius.circular(12))),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     width: 0.38 *
//                                         MediaQuery.of(context).size.width,
//                                     child: Row(
//                                       children: [
//                                         const Icon(
//                                           Icons.calendar_month,
//                                           size: 8.0,
//                                         ),
//                                         const SizedBox(
//                                           width: 2.0,
//                                         ),
//                                         Text(
//                                           convertedDate,
//                                           style: const TextStyle(
//                                             fontSize: 9.0,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 4.0,
//                                         ),
//                                         const Icon(
//                                           Icons.remove_red_eye,
//                                           size: 8.0,
//                                         ),
//                                         const SizedBox(
//                                           width: 2.0,
//                                         ),
//                                         Text(
//                                           "${peraturanind.countReader}",
//                                           style: const TextStyle(
//                                             fontSize: 9.0,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 0.14 *
//                                         MediaQuery.of(context).size.width,
//                                   ),
//                                   const Icon(
//                                     Icons.picture_as_pdf,
//                                     size: 9.0,
//                                     color: Colors.red,
//                                   ),
//                                   const SizedBox(
//                                     width: 2.0,
//                                   ),
//                                   const Text(
//                                     "Full Teks",
//                                     style: TextStyle(
//                                       fontSize: 9.0,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 8.0,
//                                   ),
//                                   const Icon(
//                                     Icons.list,
//                                     size: 9.0,
//                                     color: Color(0xFF0093AD),
//                                   ),
//                                   const SizedBox(
//                                     width: 2.0,
//                                   ),
//                                   const Text(
//                                     "Rincian",
//                                     style: TextStyle(
//                                         fontSize: 8.0,
//                                         color: Color(0xFF0093AD)),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 2.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             } else {
//               Timer(Duration(milliseconds: 39), () {
//                 scrollController
//                     .jumpTo(scrollController.position.maxScrollExtent);
//               });

//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//           itemCount: peraturans.length + (isLoading ? 1 : 0),
//         );
//       },
//     );
//   }
// }
