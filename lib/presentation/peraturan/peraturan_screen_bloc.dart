// import 'package:flutter/material.dart';
// import 'package:jdih_bumn/presentation/peraturan/widget/peraturan_widget.dart';

// class PeraturanScreen extends StatefulWidget {
//   const PeraturanScreen({super.key});

//   @override
//   State<PeraturanScreen> createState() => _PeraturanScreenState();
// }

// class _PeraturanScreenState extends State<PeraturanScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     @override
//     void initState() {
//       //context.read<GetPeraturanHukumBloc>().add(DoGetPeraturanHukumEvent());
//       // TODO: implement initState
//       super.initState();
//     }

//     final TextEditingController searchController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(
//           color: Colors.white,
//         ),
//         actions: const [],
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/appbar-bg2.png'),
//                   fit: BoxFit.fill)),
//           child: const Center(
//             child: Text(
//               "Appbar",
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.white,
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(24), topRight: Radius.circular(24))),
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Center(
//                 child: SizedBox(
//                   height: 45,
//                   width: width * 0.8,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(10),
//                     elevation: 3,
//                     child: TextFormField(
//                       controller: searchController,
//                       onFieldSubmitted: (value) {},
//                       decoration: InputDecoration(
//                           suffixIcon: InkWell(
//                             onTap: () {},
//                             child: const Padding(
//                               padding: EdgeInsets.only(left: 6),
//                               child: Icon(
//                                 Icons.search,
//                                 size: 24.0,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: const EdgeInsets.only(top: 10),
//                           border: const OutlineInputBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(7),
//                               ),
//                               borderSide: BorderSide.none),
//                           enabledBorder: const OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10)),
//                               borderSide:
//                                   BorderSide(color: Colors.black38, width: 1)),
//                           hintText: '  Ketik kata kunci pencarian....',
//                           hintStyle: const TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14.0,
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               const PeraturanWidget(),
//               // BlocBuilder<GetPeraturanHukumBloc, GetPeraturanHukumState>(
//               //   builder: (context, state) {
//               //     if (state is GetProdukHukumError) {
//               //       return const Center(
//               //         child: Text("Data Error"),
//               //       );
//               //     }
//               //     if (state is GetPeraturanHukumLoading) {
//               //       print(state);
//               //       return const Center(
//               //         child: CircularProgressIndicator(),
//               //       );
//               //     }
//               //     if (state is GetPeraturanHukumLoaded) {
//               //       if (state.data.items!.isEmpty) {
//               //         return const Center(
//               //           child: Text("Data Kosong"),
//               //         );
//               //       }

//               //       return ListView.builder(
//               //         itemBuilder: (context, index) {
//               //           final Item peraturan = state.data.items![index];
//               //           print(peraturan);
//               //           return PeraturanWidget(
//               //               judul: peraturan.bentuk,
//               //               nosk: peraturan.perNo,
//               //               isi: peraturan.tentang,
//               //               tgl_publikasi: peraturan.publishedAt,
//               //               jml_dilihat: peraturan.readingCounter.toString());
//               //         },
//               //       );
//               //     }
//               //     return const Center(
//               //       child: Text("ddd"),
//               //     );
//               //   },
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
