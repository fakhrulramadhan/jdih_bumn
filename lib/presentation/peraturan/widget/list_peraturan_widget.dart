import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/bloc/get_peraturan_hukum/get_peraturan_hukum_bloc.dart';
import 'package:jdih_bumn/data/model/response/peraturan_hukum_response_model.dart';
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
    context.read<GetPeraturanHukumBloc>().add(DoGetPeraturanHukumEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPeraturanHukumBloc, GetPeraturanHukumState>(
        builder: (context, state) {
      if (state is GetPeraturanHukumLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is GetPeraturanHukumError) {
        return const Center(
          child: Text('data error'),
        );
      }
      if (state is GetPeraturanHukumLoaded) {
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
              print("ini jumlah datanya ${state.data.items!.length}");
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return PeraturanDetailScreen(peraturanHukum: peraturan);
                    }),
                  );
                },
                child: SizedBox(
                  height: 260,
                  width: 361,
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        width: 361,
                        //color: Colors.brown,
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 10, right: 10),
                        child: Stack(
                          children: [
                            Container(
                              height: 220,
                              width: 341,
                              //color: Colors.yellow,
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    peraturan.bentuk ?? '',
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
                                    peraturan.perNo ?? '',
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
                                    peraturan.tentang ?? '',
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 130,
                              width: 341,
                              color: Colors.transparent,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 37,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(0),
                                        topRight: Radius.circular(8)),
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
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xFFECF0F1),
                        height: 30,
                        width: 360,
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 140,
                              height: 30,
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
                                    peraturan.publishedAt ?? '',
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
                                    peraturan.readingCounter.toString(),
                                    style: const TextStyle(
                                      fontSize: 9.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
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
                            )
                          ],
                        ),
                      )
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
