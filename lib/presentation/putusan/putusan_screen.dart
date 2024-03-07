import 'package:flutter/material.dart';
import 'package:flutter_close_app/flutter_close_app.dart';
import 'package:jdih_bumn/presentation/putusan/widget/list_putusan_widget.dart';
import 'package:jdih_bumn/presentation/putusan_search/putusan_search_screen.dart';

class PutusanScreen extends StatefulWidget {
  const PutusanScreen({super.key});

  @override
  State<PutusanScreen> createState() => _PutusanScreenState();
}

class _PutusanScreenState extends State<PutusanScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    @override
    void initState() {
      //context.read<GetPeraturanHukumBloc>().add(DoGetPeraturanHukumEvent());
      //konekin dulu datasourcenya
      //context.read<GetPutusanBloc>().add(DoGetPutusanEvent());
      // TODO: implement initState
      super.initState();
    }

    return FlutterCloseAppPage(
      interval: 2,
      condition: true,
      onCloseFailed: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Tekan Sekali Lagi Untuk Keluar Aplikasi"),
        ));
      },
      child: Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 90,
        //   leading: const BackButton(
        //     color: Colors.white,
        //   ),
        //   actions: const [],
        //   flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //         image: DecorationImage(
        //       image: AssetImage(
        //         'assets/images/appbar-bg2.png',
        //       ),
        //       fit: BoxFit.fill,
        //     )),
        //     child: const Center(
        //       child: Text(
        //         "Peraturan",
        //         style: TextStyle(
        //           fontSize: 20.0,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        body: SafeArea(
            child: Stack(
          children: [
            Image.asset(
              "assets/images/appbar-bg2.png",
              width: width,
              height: 110.0,
              fit: BoxFit.none,
            ),
            SingleChildScrollView(
              controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          width: 0.195 * MediaQuery.of(context).size.width,
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 90,
                            width: 195,
                            child: Center(
                              child: Text(
                                "Putusan",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Center(
                            child: Container(
                              height: 45,
                              width: width * 0.9,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24))),
                              child: Material(
                                borderRadius: BorderRadius.circular(10),
                                elevation: 3,
                                child: TextFormField(
                                  controller: searchController,
                                  onFieldSubmitted: (value) {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) {
                                    //     print(searchController.text);
                                    //     return PutusanSearchScreen();
                                    //   }),
                                    // );
                                    ListPutusanWidgetState.instance
                                        .updateSearch(value);
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                        onTap: () {},
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 6),
                                          child: Icon(
                                            Icons.search,
                                            size: 24.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.only(
                                          top: 10, left: 20, right: 20),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(7),
                                          ),
                                          borderSide: BorderSide.none),
                                      enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Colors.black38, width: 1)),
                                      hintText:
                                          'Ketik kata kunci pencarian....',
                                      hintStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const ListPutusanWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
