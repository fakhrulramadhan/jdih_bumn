import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jdih_bumn/bloc/stage/get_peraturan_populer.dart/get_peraturan_populer_bloc.dart';
import 'package:jdih_bumn/presentation/populer_detail/populer_detail_screen.dart';

import '../../../data/model/response/stage/peraturan_populers_response_model.dart';
//import '../../../data/model/response/stage/peraturan_populer_new_response_model.dart';

class PopulerWidget extends StatefulWidget {
  // final String judul;
  // final String nosk;
  // final String isi;
  // final String tgl_publikasi;
  // final String jml_dilihat;
  const PopulerWidget({
    super.key,
    //required this.judul,
    // required this.nosk,
    // required this.isi,
    // required this.tgl_publikasi,
    // required this.jml_dilihat
  });

  @override
  State<PopulerWidget> createState() => _PopulerWidgetState();
}

class _PopulerWidgetState extends State<PopulerWidget> {
  @override
  void initState() {
    context.read<GetPeraturanPopulerBloc>().add(DoGetPeraturanPopulerEvent());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPeraturanPopulerBloc, GetPeraturanPopulerState>(
      builder: (context, state) {
        if (state is GetPeraturanPopulerStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetPeraturanPopulerStateError) {
          return const Center(
            child: Text("Data Error"),
          );
        }

        if (state is GetPeraturanPopulerStateLoaded) {
          if (state.data.items!.isEmpty) {
            return const Center(
              child: Text("Data Kosong"),
            );
          }
          return ListView.builder(
            itemCount: state.data.items!.length,
            // physics: const ScrollPhysics(),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, index) {
              final Item peraturanPopuler = state.data.items![index];

              print("ini jumlah datanya ${state.data.items!.length}");
              var parsedDate =
                  DateTime.parse('${peraturanPopuler.tglPenetapan}');

              String tglPerngundangan =
                  DateFormat("dd-MM-yyyy").format(parsedDate);

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PopulerDetailScreen(
                            peraturanPopuler: peraturanPopuler)),
                  );
                },
                child: SizedBox(
                  height: 185,
                  width: 341,
                  child: Column(
                    children: [
                      Container(
                        height: 165,
                        width: 341,
                        //margin: const EdgeInsets.only(bottom: 20),
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
                              height: 135,
                              width: 341,
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 115,
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
                                            "${peraturanPopuler.jenis}",
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
                                          "${peraturanPopuler.nomorPeraturanBaru}",
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
                                          "${peraturanPopuler.deskripsiTentang}",
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
                                ],
                              ),
                            ),
                            Container(
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
                                    tglPerngundangan,
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
                                    "${peraturanPopuler.countReader}",
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
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
