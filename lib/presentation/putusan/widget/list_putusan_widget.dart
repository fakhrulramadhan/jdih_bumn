// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jdih_bumn/bloc/stage/get_putusan/get_putusan_bloc.dart';
import 'package:jdih_bumn/data/model/response/stage/putusan_response_model.dart';
import 'package:jdih_bumn/presentation/putusan_detail/putusan_detail_screen.dart';

class ListPutusanWidget extends StatefulWidget {
  // final String title;
  // final String subtitle;
  // final String detail;
  // final String date;
  // final String readCount;
  final Function()? onTap;
  const ListPutusanWidget({
    Key? key,
    // required this.title,
    // required this.subtitle,
    // required this.detail,
    // required this.date,
    // required this.readCount,
    this.onTap,
  }) : super(key: key);

  @override
  State<ListPutusanWidget> createState() => _ListPutusanWidgetState();
}

class _ListPutusanWidgetState extends State<ListPutusanWidget> {
  @override
  void initState() {
    context.read<GetPutusanBloc>().add(DoGetPutusanEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPutusanBloc, GetPutusanState>(
      builder: (context, state) {
        if (state is GetPutusanLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetPutusanError) {
          return const Center(
            child: Text("Data Error"),
          );
        }

        if (state is GetPutusanLoaded) {
          if (state.data.items!.isEmpty) {
            return const Center(
              child: Text("Data Kosong"),
            );
          }

          return ListView.builder(
            itemCount: state.data.items!.length,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              final Item putusan = state.data.items![index];

              print("ini jumlah datanya ${state.data.items!.length}");

              var parsedDate = DateTime.parse('${putusan.tglPenetapan}');

              String tglPenetapan =
                  DateFormat("dd-MM-yyyy").format(parsedDate);

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
                      height: putusan.judul!.length >= 100 ? 215 : 165,
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
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Column(
                        children: [
                          Container(
                            //height: 185,
                            height: putusan.judul!.length >= 100 ? 185 : 135,
                            width: 361,
                            //color: Colors.brown,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12))),
                            child: Stack(
                              children: [
                                Container(
                                  // height: putusan.judul!.length >= 100 ? 165 : 120,
                                  height: 165,
                                  width: 341,
                                  //color: Colors.yellow,
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${putusan.nomorPerkara}",
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF0093AD),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        "${putusan.nomorPutusan}",
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        "${putusan.judul}",
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
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
                            width: 390,
                            padding: const EdgeInsets.only(left: 20),
                            decoration: const BoxDecoration(
                                color: Color(0xFFECF0F1),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 170,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
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
                                        tglPenetapan,
                                        style: const TextStyle(
                                          fontSize: 9.0,
                                          color: Colors.black,
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
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
