// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_faq/get_faq_bloc.dart';

import '../../../data/model/response/stage/faq_response_model.dart';

class FaqWidget extends StatefulWidget {
  const FaqWidget({Key? key}) : super(key: key);

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  final bool _customTileExpanded = false;
  final bool _customTileExpandedtwo = false;
  final bool _customTileExpandedThree = false;
  final bool _customTileExpandedFour = false;
  bool _customTileExpandedFive = false;
  final bool _customTileExpandedSix = false;
  final bool _customTileExpandedSeven = false;
  final bool _customTileExpandedEight = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    context.read<GetFaqBloc>().add(DoGetFaqEvent());
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      BlocBuilder<GetFaqBloc, GetFaqState>(
                        builder: (context, state) {
                          if (state is GetFaqLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is GetFaqError) {
                            return const Center(
                              child: Text("Data Error"),
                            );
                          }
                          if (state is GetFaqLoaded) {
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
                                final Item faq = state.data.items![index];
                                print(
                                    "ini jumlah datanya ${state.data.items!.length}");
                                return ExpansionTile(
                                  title: Text(
                                    "${faq.question}",
                                    overflow: TextOverflow.visible,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  trailing: Icon(
                                    _customTileExpandedFive
                                        ? Icons.south_east_outlined
                                        : Icons.north_east_outlined,
                                    color: Colors.black,
                                  ),
                                  onExpansionChanged: (bool expandedFive) {
                                    setState(() {
                                      _customTileExpandedFive = expandedFive;
                                    });
                                  },
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "${faq.answer}",
                                        overflow: TextOverflow.visible,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  )),
            ),
          ),
        ),
        onWillPop: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Maaf, tidak bisa ke halaman sebelumnya'),
              backgroundColor: Colors.red,
            ),
          );
          return false;
        });
  }
}
