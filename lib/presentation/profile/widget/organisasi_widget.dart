import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:jdih_bumn/bloc/stage/get_struktur_jdih/get_struktur_jdih_bloc.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:widget_zoom/widget_zoom.dart';

class OrgansisasiWidget extends StatefulWidget {
  const OrgansisasiWidget({super.key});

  @override
  State<OrgansisasiWidget> createState() => _OrgansisasiWidgetState();
}

class _OrgansisasiWidgetState extends State<OrgansisasiWidget> {
  @override
  void initState() {
    context.read<GetStrukturJdihBloc>().add(DoGetStrukturJdihEvent());
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
              "Struktur Organisiasi JDIH Kementerian BUMN",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          SizedBox(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                      width: 344,
                      height: 210,
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
                                child: CircularProgressIndicator(),
                              );
                            }

                            return ListView.builder(
                              itemCount: state.data.items!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                final strukturJdih = state.data.items![index];

                                print(
                                    "ini jumlah datanya ${state.data.items!.length}");
                                //  Image.network(
                                //     "${strukturJdih.organisasi}",
                                //     // width: 350,
                                //     // height: 205,
                                //     fit: BoxFit.fill,
                                //   ),

                                return InkWell(
                                  onTap: () => showImageViewer(
                                      context,
                                      Image.network(
                                              "${strukturJdih.organisasi}")
                                          .image,
                                      swipeDismissible: true,
                                      // backgroundColor: Colors.white
                                      backgroundColor:
                                          Colors.white.withOpacity(0.7),
                                      closeButtonColor: Colors.black),
                                  child: Container(
                                      width: 350,
                                      height: 205,
                                      //color: Colors.white,
                                      child: CachedNetworkImage(
                                        imageUrl: "${strukturJdih.organisasi}",
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            child: CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error,
                                          size: 24.0,
                                        ),
                                        width: 350,
                                        height: 205,
                                      )),
                                );

                                // return InteractiveViewer(
                                //     maxScale: 5.0,
                                //     minScale: 0.01,
                                //     boundaryMargin:
                                //         EdgeInsets.all(double.infinity),
                                //     child: Image.network(
                                //         "${strukturJdih.organisasi}"));

                                // return Container(
                                //   width: 350,
                                //   height: 205,
                                //   child: InstaImageViewer(
                                //       // backgroundColor: Colors.white,
                                //       backgroundIsTransparent: true,
                                //       child: Image.network(
                                //         "${strukturJdih.organisasi}",
                                //       )),
                                // );
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
        ],
      ),
    );
  }
}


//  SizedBox(
//             child: Column(
//               children: [
//                 Center(
//                   child: SizedBox(
//                     width: 344,
//                     height: 210,
//                     child: Image.asset(
//                       "assets/images/struktur_jdih_final.png",
//                       width: 340,
//                       height: 205,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 37.0,
//                 ),
//                 SvgPicture.asset(
//                   "assets/images/BUMN Background.svg",
//                   height: 153,
//                   width: MediaQuery.of(context).size.width * 0.8,
//                 ),
//               ],
//             ),
//           ),