// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jdih_bumn/bloc/stage/get_berita/get_berita_bloc.dart';
import 'package:jdih_bumn/presentation/berita_detail/berita_detail_screen.dart';

class BeritaDanInfoWidget extends StatefulWidget {
  // final String title;
  // final String waktu;
  final VoidCallback? onTap;

  const BeritaDanInfoWidget({Key? key, this.onTap}) : super(key: key);

  @override
  State<BeritaDanInfoWidget> createState() => _BeritaDanInfoWidgetState();
}

class _BeritaDanInfoWidgetState extends State<BeritaDanInfoWidget> {
  @override
  void initState() {
    context.read<GetBeritaBloc>().add(DoGetBeritaEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBeritaBloc, GetBeritaState>(
      builder: (context, state) {
        if (state is GetBeritaError) {
          return const Center(
            child: Text("Data Error"),
          );
        }

        if (state is GetBeritaLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetBeritaLoaded) {
          return ListView.builder(
            itemCount: 1,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              //final sortberita = state.data.items![0];
              //cukup ambil data berita pertamanya aja dari api
              final sortberita = state.data.items!.firstOrNull;

              print('${sortberita?.tanggal}');
              print("INI TANGGAL BERITANYA");

              var parsedDate = DateTime.parse('${sortberita?.tanggal}');

              String convertedDate =
                  DateFormat("dd-MM-yyyy").format(parsedDate);
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BeritaDetailScreen(berita: sortberita)),
                  );
                },
                child: Center(
                  child: Container(
                    height: 240,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.yellow[50],
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                              blurRadius: 2),
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Text(
                          "${sortberita?.judul}",
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 0, 9, 85),
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Center(
                          child: Text(
                            convertedDate,
                            style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),

                          //  Image.network(
                          //   "${sortberita?.imagePathFull}",
                          //   width: 270.0,
                          //   height: 140.0,
                          //   fit: BoxFit.cover,
                          // ),
                          child: CachedNetworkImage(
                            imageUrl: "${sortberita?.imagePathFull}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: Container(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              size: 24.0,
                            ),
                            width: 270.0,
                            height: 140.0,
                          ),
                        ),
                      ],
                    ),
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
