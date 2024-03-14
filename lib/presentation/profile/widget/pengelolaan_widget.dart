import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:jdih_bumn/bloc/stage/get_struktur_jdih/get_struktur_jdih_bloc.dart';

class PengelolaanWidget extends StatefulWidget {
  const PengelolaanWidget({super.key});

  @override
  State<PengelolaanWidget> createState() => _OrgansisasiWidgetState();
}

class _OrgansisasiWidgetState extends State<PengelolaanWidget> {
  @override
  void initState() {
    context.read<GetStrukturJdihBloc>().add(DoGetStrukturJdihEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 445,
      child: Column(
        children: [
          const Center(
            child: Text(
              "Struktur Pengelolaan JDIH Kementerian BUMN",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          // width: 340,
          //height: 431,
          // const SizedBox(
          //   height: 25.0,
          // ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                        width: 344,
                        height: 205,
                        child: BlocBuilder<GetStrukturJdihBloc,
                            GetStrukturJdihState>(
                          builder: (context, state) {
                            if (state is GetStrukturJdihError) {
                              return const Center(
                                child: Text("Data Error"),
                              );
                            }

                            if (state is GetStrukturJdihLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (state is GetStrukturJdihLoaded) {
                              if (state.data.items!.isEmpty) {
                                return const Center(
                                  child: Text("Data Empty"),
                                );
                              }
                              return ListView.builder(
                                itemCount: state.data.items!.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final strukturJdih = state.data.items![index];

                                  print(
                                      "ini jumlah datanya ${state.data.items!.length}");

                                  // Image.network(
                                  //     "${strukturJdih.pengelola}",
                                  //     // width: 340,
                                  //     // height: 231,
                                  //     fit: BoxFit.fill,
                                  //   ),
                                  return InkWell(
                                    onTap: () => showImageViewer(
                                        context,
                                        Image.network(
                                                "${strukturJdih.pengelola}")
                                            .image,
                                        swipeDismissible: true,
                                        useSafeArea: true,
                                        // backgroundColor: Colors.white
                                        doubleTapZoomable: true,
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                        closeButtonColor: Colors.black),
                                    child: SizedBox(
                                        width: 340, //340
                                        height: 240, //440
                                        child: CachedNetworkImage(
                                          imageUrl: "${strukturJdih.pengelola}",
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress,
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                            Icons.error,
                                            size: 24.0,
                                          ),
                                          width: 340,
                                          height: 231,
                                        )),
                                  );
                                },
                              );
                            }

                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        )),
                  ),
                  const SizedBox(
                    height: 37.0,
                  ),
                  SvgPicture.asset(
                    "assets/images/BUMN Background.svg",
                    height: 153,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// SvgPicture.asset(
//                         "assets/images/pengelolaans.svg",
//                         fit: BoxFit.fill,
//                       ),
