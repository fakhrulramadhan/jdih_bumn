import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jdih_bumn/bloc/stage/get_berita/get_berita_bloc.dart';
import 'package:jdih_bumn/data/model/response/stage/berita_response_model.dart';
import 'package:jdih_bumn/presentation/berita_detail/berita_detail_screen.dart';

class ListBeritaWidget extends StatefulWidget {
  const ListBeritaWidget({super.key});

  @override
  State<ListBeritaWidget> createState() => _ListBeritaWidgetState();
}

class _ListBeritaWidgetState extends State<ListBeritaWidget> {
  @override
  void initState() {
    //context.read<GetProdukHukumBloc>().add(DoGetProdukHukumEvent());
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
          if (state.data.items!.isEmpty) {
            return const Center(
              child: Text("Data Kosong"),
            );
          }

          //buat list<model> terlebih dahulu
          //agar bisa digunakan di itemcount
          List<Item>? itemBerita = state.data.items;
          return GridView.builder(
            //padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //0.65
              childAspectRatio: 0.7,
              crossAxisCount: 2,
              mainAxisSpacing: 12, //ke bawah spasi
              crossAxisSpacing: 25, //ke samping spasi
            ),
            itemCount: itemBerita!.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final Item berita = state.data.items![index];

              var parsedDate = DateTime.parse('${berita.tanggal}');

              String convertedDate =
                  DateFormat("dd-MM-yyyy").format(parsedDate);

              print("ini beritanya");
              print("$berita");

              // return BeritaWidget(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const BeritaDetailScreen()),
              //     );
              //   },
              // );

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return BeritaDetailScreen(berita: berita);
                    }),
                  );
                },
                child: Container(
                  height: 240,
                  width: 180,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 2))
                    ],
                  ),
                  child: Column(
                    children: [
                      //agar diatasnya rounded, maka di imagenya kasih
                      // cliprrect di image
                      Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          child: Container(
                            color: Colors.grey.withOpacity(0.1),
                            //  Image.network(
                            //   "${berita.imagePathFull}",
                            //   width: 180.0,
                            //   height: 122.0,
                            //   fit: BoxFit.cover,
                            // ),
                            child: CachedNetworkImage(
                              imageUrl: "${berita.imagePathFull}",
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                size: 24.0,
                              ),
                              height: 122,
                              width: 180,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${convertedDate}",
                          style: const TextStyle(
                            fontSize: 8.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 36,
                        child: Text(
                          "${berita.judul}",
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // const Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: Text(
                      //     "Baca Selengkapnya....",
                      //     style: TextStyle(
                      //         fontSize: 10.0,
                      //         fontWeight: FontWeight.w400,
                      //         color: Colors.blue),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 15.0,
                      // ),
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
