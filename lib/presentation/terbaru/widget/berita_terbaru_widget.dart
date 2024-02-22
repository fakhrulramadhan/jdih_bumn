import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jdih_bumn/bloc/stage/get_peraturan_terbaru/get_peraturan_terbaru_bloc.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_terbaru_response_model.dart';
import 'package:jdih_bumn/presentation/terbaru_detail/terbaru_detail_screen.dart';

class BeritaTerbaruWidget extends StatefulWidget {
  // final String judul;
  // final String nosk;
  // final String isi;
  // final String tgl_publikasi;
  // final String jml_dilihat;
  const BeritaTerbaruWidget({
    super.key,
    // required this.judul,
    // required this.nosk,
    // required this.isi,
    // required this.tgl_publikasi,
    // required this.jml_dilihat
  });

  @override
  State<BeritaTerbaruWidget> createState() => _BeritaTerbaruWidgetState();
}

class _BeritaTerbaruWidgetState extends State<BeritaTerbaruWidget> {
  @override
  void initState() {
    context.read<GetPeraturanTerbaruBloc>().add(DoGetPeraturanTerbaruEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPeraturanTerbaruBloc, GetPeraturanTerbaruState>(
      builder: (context, state) {
        if (state is GetPeraturanTerbaruLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetPeraturanTerbaruError) {
          return Center(
            child: Text("Data Error"),
          );
        }

        if (state is GetPeraturanTerbaruLoaded) {
          if (state.data.items!.isEmpty) {
            return Center(
              child: Text("Data Kosong"),
            );
          }

          return ListView.builder(
            itemCount: state.data.items!.length,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, index) {
              final Item peraturanTerbaru = state.data.items![index];

              print(peraturanTerbaru);

              print("ini jumlah datanya ${state.data.items!.length}");

              var parsedDate =
                  DateTime.parse('${peraturanTerbaru.tanggalPengundangan}');

              String convertedDate =
                  DateFormat("dd-MM-yyyy").format(parsedDate);

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TerbaruDetailScreen(
                            peraturanTerbaru: peraturanTerbaru)),
                  );
                },
                child: SizedBox(
                  height: 235,
                  width: 341,
                  child: Column(
                    children: [
                      Container(
                        height: 210,
                        width: 341,
                        //margin: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2,
                                  offset: Offset(2, 2),
                                  blurRadius: 2)
                            ],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            )),
                        child: Column(
                          children: [
                            Container(
                              height: 180,
                              width: 341,
                              color: Colors.white,
                              padding: const EdgeInsets.only(left: 20),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 160,
                                    width: 341,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        SizedBox(
                                          width: 260,
                                          child: Text(
                                            "${peraturanTerbaru.jenis}",
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF0093AD),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          "${peraturanTerbaru.perNoBaru}",
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
                                          "${peraturanTerbaru.judul}",
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: -75,
                                    right: -136,
                                    child: Container(
                                      height: 180,
                                      width: 341,
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
                                                fontSize: 8.0,
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
                              //color: const Color(0xFFECF0F1),
                              height: 30,
                              width: 341,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFECF0F1),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12))),
                              padding: const EdgeInsets.only(left: 20),
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
                                    "${convertedDate}",
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
                                    "${peraturanTerbaru.countReader}",
                                    style: const TextStyle(
                                      fontSize: 9.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
