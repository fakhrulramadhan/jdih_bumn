import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_infografis/get_infografis_bloc.dart';
import 'package:jdih_bumn/data/model/response/stage/infografis_response_model.dart';
import 'package:jdih_bumn/presentation/infografis/infografis_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class InfoGrafisWidgetNew extends StatefulWidget {
  //final String text;
  //final VoidCallback onTap;
  final Function()? onTap;
  const InfoGrafisWidgetNew({super.key, this.onTap});

  @override
  State<InfoGrafisWidgetNew> createState() => _InfoGrafisWidgetNewState();
}

class _InfoGrafisWidgetNewState extends State<InfoGrafisWidgetNew> {
  @override
  void initState() {
    context.read<GetInfografisBloc>().add(DoGetInfografisEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool enabled = true;
    return BlocBuilder<GetInfografisBloc, GetInfografisState>(
      builder: (context, state) {
        if (state is GetInfografisError) {
          return const Center(
            child: Text("Data Error"),
          );
        }

        if (state is GetInfografisLoading) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Skeletonizer(
            enabled: true, //nyalain layout mockupnya
            child: ListView.builder(
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                //final Item infografis = state.data.items![index];

                return InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           InfografisScreen(infografis: infografis)),
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 195,
                      width: 150,
                      // color: Colors.purple,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 9, 85),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 70,
                              child: Text(
                                "test",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          //index ke 0
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Container(
                              width: 125.0,
                              height: 100.0,
                              //kalau belum keload gambarnya
                              color: Colors.grey.withOpacity(0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        if (state is GetInfografisLoaded) {
          if (state.data.items!.isEmpty) {
            return const Center(
              child: Text("Data Kosong"),
            );
          }

          return Skeletonizer(
            enabled: false, //matikan mockup
            child: ListView.builder(
              itemCount: state.data.items!.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                final Item infografis = state.data.items![index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              InfografisScreen(infografis: infografis)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 195,
                      width: 150,
                      // color: Colors.purple,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 9, 85),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 70,
                              child: Text(
                                "${infografis.judul}",
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          //index ke 0
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Container(
                              width: 125.0,
                              height: 100.0,
                              //kalau belum keload gambarnya
                              color: Colors.grey.withOpacity(0.1),
                              child: Image.network(
                                "${infografis.details![0].imagePath}",
                                // width: 125.0,
                                // height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
