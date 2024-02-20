// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jdih_bumn/bloc/stage/get_faq/get_faq_bloc.dart';

import '../../../data/model/response/stage/faq_response_model.dart';

class FaqWidget extends StatefulWidget {
  const FaqWidget({Key? key}) : super(key: key);

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  bool _customTileExpanded = false;
  bool _customTileExpandedtwo = false;
  bool _customTileExpandedThree = false;
  bool _customTileExpandedFour = false;
  bool _customTileExpandedFive = false;
  bool _customTileExpandedSix = false;
  bool _customTileExpandedSeven = false;
  bool _customTileExpandedEight = false;
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
            padding: EdgeInsets.all(8.0),
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
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is GetFaqError) {
                            return Center(
                              child: Text("Data Error"),
                            );
                          }
                          if (state is GetFaqLoaded) {
                            if (state.data.items!.isEmpty) {
                              return Center(
                                child: Text("Data Kosong"),
                              );
                            }
                            return ListView.builder(
                              itemCount: state.data.items!.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                final Item faq = state.data.items![index];
                                print(
                                    "ini jumlah datanya ${state.data.items!.length}");
                                return ExpansionTile(
                                  title: Text(
                                    "${faq.question}",
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
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
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          }
                          return Center(
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
