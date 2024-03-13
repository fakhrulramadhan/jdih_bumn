import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
//import 'package:jdih_bumn/bloc/get_peraturan_hukum/get_peraturan_hukum_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_peraturan/get_peraturan_bloc.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturans_response_model.dart';
import 'package:jdih_bumn/presentation/peraturan_detail/peraturan_detail_screen.dart';

class ListPeraturanWidget extends StatefulWidget {
  // final String? judul;
  // final String? nosk;
  // final String? isi;
  // final String? tgl_publikasi;
  // final String? jml_dilihat;
  const ListPeraturanWidget({super.key});

  @override
  State<ListPeraturanWidget> createState() => _ListPeraturanWidgetState();
}

class _ListPeraturanWidgetState extends State<ListPeraturanWidget> {
  @override
  void initState() {
    context.read<GetPeraturanBloc>().add(DoGetPeraturanEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<GetPeraturanBloc, GetPeraturanState>(
        builder: (context, state) {
      if (state is GetPeraturanLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is GetPeraturanError) {
        return const Center(
          child: Text('data error'),
        );
      }
      if (state is GetPeraturanLoaded) {
        if (state.data.items!.isEmpty) {
          return const Center(
            child: Text("Data kosong"),
          );
        }

        return ListView.builder(
            itemCount: state.data.items!.length,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              final Item peraturan = state.data.items![index];

              var parsedDate = DateTime.parse('${peraturan.createdAt}');

              String convertedDate =
                  DateFormat("dd-MM-yyyy").format(parsedDate);
              print("ini jumlah datanya ${state.data.items!.length}");
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return PeraturanDetailScreen(peraturan: peraturan);
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
                                          peraturan.nomorPeraturanBaru ?? '-',
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
                                          peraturan.nomorPeraturanBaru ?? '',
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
                                          peraturan.deskripsiTentang ?? '',
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
                              width: width,
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
                                    width: 0.38 * width,
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
                                          "${peraturan.countReader}",
                                          style: const TextStyle(
                                            fontSize: 9.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.14 * width,
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
                                        fontSize: 8.0,
                                        color: Color(0xFF0093AD)),
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
            });
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
