import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/bloc/get_produk_hukum/get_produk_hukum_bloc.dart';
import 'package:jdih_bumn/data/model/response/produk_hukum_response_model.dart';
import 'package:jdih_bumn/presentation/monografi_detail/monografi_detail_screen.dart';

class ListMonografiWidget extends StatefulWidget {
  const ListMonografiWidget({super.key});

  @override
  State<ListMonografiWidget> createState() => _ListMonografiWidgetState();
}

class _ListMonografiWidgetState extends State<ListMonografiWidget> {
  @override
  void initState() {
    context.read<GetProdukHukumBloc>().add(DoGetProdukHukumEvent());

    // TODO: implement initState
    super.initState();
  }

  final _scrollcontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProdukHukumBloc, GetProdukHukumState>(
      builder: (context, state) {
        if (state is GetProdukHukumError) {
          return const Center(
            child: Text("Data Error"),
          );
        }
        if (state is GetProdukHukumLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetProdukHukumLoaded) {
          List<ProdukHukumResponseModel> produkhukumList = state.data;

          return GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            controller: ScrollController(), //agar smooth
            scrollDirection: Axis.vertical,
            itemCount: produkhukumList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7), //170 w : 200 = 0.85 h
            itemBuilder: (context, index) {
              ProdukHukumResponseModel produkhukum = produkhukumList[index];
              print("ini datanya");
              print(produkhukumList[0].judul);
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return MonografiDetailScreen(
                        produkhukum: produkhukum,
                      );
                    }),
                  );
                },
                child: Container(
                  // height: 270,
                  // width: 170,
                  //padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffEBEBF9),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                            blurRadius: 2)
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "${produkhukum.judul}",
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "${produkhukum.penerbit}",
                            style: const TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(
                          "assets/images/lorem-book-ori-removebg.png",
                          width: 140.0,
                          height: 170.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        return const Center(
          child: Center(
            child: Text("Belum ada data"),
          ),
        );
      },
    );
  }
}
