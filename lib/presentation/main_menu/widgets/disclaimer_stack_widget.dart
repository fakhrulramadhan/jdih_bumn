import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jdih_bumn/bloc/stage/get_disclaimer/get_disclaimer_bloc.dart';
import 'package:jdih_bumn/data/model/response/stage/disclaimer_response_model.dart';

class DisclaimerStackWidget extends StatefulWidget {
  const DisclaimerStackWidget({super.key});

  @override
  State<DisclaimerStackWidget> createState() => _DisclaimerStackWidgetState();
}

class _DisclaimerStackWidgetState extends State<DisclaimerStackWidget> {
  @override
  void initState() {
    //load data dari api dulu ketika (awal) halaman
    //dibuka
    context.read<GetDisclaimerBloc>().add(DoGetDisclaimerEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 430,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                    blurRadius: 2)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                "assets/images/appbar-bg2.png",
                width: MediaQuery.of(context).size.width * 0.87,
                height: 195.0,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
        Center(child: BlocBuilder<GetDisclaimerBloc, GetDisclaimerState>(
          builder: (context, state) {
            if (state is GetDisclaimerLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GetDisclaimerError) {
              return const Center(
                child: Text("Data Error"),
              );
            }

            if (state is GetDisclaimerLoaded) {
              if (state.data.items!.isEmpty) {
                return const Center(
                  child: Text("Data Kosong"),
                );
              }

              return ListView.builder(
                itemCount: state.data.items!.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  final Item disclaimer = state.data.items![index];

                  return Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 430,
                    padding: const EdgeInsets.all(25),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "${disclaimer.judul}",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SvgPicture.asset(
                          "assets/images/Disclaimer.svg",
                          alignment: Alignment.center,
                          height: 189,
                          width: 159,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "${disclaimer.deskripsi}",
                          style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
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
        )),
      ],
    );
  }
}
