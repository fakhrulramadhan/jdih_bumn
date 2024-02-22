// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_berita/get_berita_bloc.dart';

class BeritaDanInfoWidgetSort extends StatefulWidget {
  // final String title;
  // final String waktu;
  final VoidCallback? onTap;

  const BeritaDanInfoWidgetSort({Key? key, this.onTap}) : super(key: key);

  @override
  State<BeritaDanInfoWidgetSort> createState() =>
      _BeritaDanInfoWidgetSortState();
}

class _BeritaDanInfoWidgetSortState extends State<BeritaDanInfoWidgetSort> {
  @override
  void initState() {
    context.read<GetBeritaBloc>().add(DoGetBeritaSort());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBeritaBloc, GetBeritaState>(
      builder: (context, state) {
        if (state is GetBeritaError) {
          return Center(
            child: Text("Data Error"),
          );
        }

        if (state is GetBeritaLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetBeritaSort) {
          return ListView.builder(
            itemCount: state.data.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final sortberita = state.data[index];
              return InkWell(
                onTap: widget.onTap,
                child: Center(
                  child: Container(
                    height: 190,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.only(top: 10),
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
                          "${sortberita.judul}",
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 0, 9, 85),
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Center(
                          child: Text(
                            "${sortberita.tanggal}",
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
                          child: Image.network(
                            "${sortberita.imagePathFull}",
                            width: 270.0,
                            height: 90.0,
                            fit: BoxFit.fill,
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

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
