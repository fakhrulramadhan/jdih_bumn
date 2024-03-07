import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_close_app/flutter_close_app.dart';
import 'package:jdih_bumn/bloc/stage/get_kamus_hukum/get_kamus_hukum_bloc.dart';
import 'package:jdih_bumn/constants/constants.dart';
import 'package:jdih_bumn/data/datasources/stage/kamus_hukum_datasource.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/body_kamus_page.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/body_kamus_page_two.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/widget/body_kamus_widget.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/widget/kamus_sebelumnya_button_widget.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/widget/title_kamus_widget.dart';
import './widget/kamus_selanjutnya_button_widget_new.dart';
import 'package:jdih_bumn/data/model/response/stage/kamus_hukum_response_model.dart';
import 'package:http/http.dart' as http;

class KamusHukumScreen extends StatefulWidget {
  const KamusHukumScreen({super.key});

  @override
  State<KamusHukumScreen> createState() => _KamusHukumScreenState();
}

class _KamusHukumScreenState extends State<KamusHukumScreen> {
  // int pageIndex = 0;
  // late Future<List<Item>> futurePosts;

  int _currentPage = 1;
  List<Item> _items = [];
  final PageController _controller = PageController();

  Future<void> _loadItems(int page) async {
    final response = await http.get(Uri.parse(
        "${Constants.baseUrlStage}/publikasi/kamus-hukum?page=$page"));

    if (response.statusCode == 200) {
      // output tipe datanya dalam bentuk map (yang dibawah), bukan
      // dalam bentuk list
      // List<dynamic> data = json.decode(response.body);
      // List<Item> fetchedItems =
      //     data.map((item) => Item.fromJson(item)).toList();

      Map<String, dynamic> responseData = json.decode(response.body);
      List<dynamic> data = responseData['items'];
      List<Item> fetchedItems =
          data.map((item) => Item.fromJson(item)).toList();

      setState(() {
        _items = fetchedItems;
      });
    } else {
      throw Exception('Failed to load items');
    }
  }

  @override
  void initState() {
    //context.read<GetKamusHukumBloc>().add(DoGetKamusHukumEvent());
    // TODO: implement initState
    super.initState();
    // _loadPage(_currentPage);
    _loadItems(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    PageController page = PageController(
      initialPage: 0,
      viewportFraction: 1,
    );

    final TextEditingController searchController = TextEditingController();
    return FlutterCloseAppPage(
      interval: 2,
      condition: true,
      onCloseFailed: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Tekan Sekali Lagi Untuk Keluar Aplikasi"),
        ));
      },
      child: Scaffold(
        //  kamus hukum pakai pagination, buat lihat data selanjutnya
        resizeToAvoidBottomInset: false,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          width: 0.185 * MediaQuery.of(context).size.width,
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 90,
                            width: 150,
                            child: Center(
                              child: Text(
                                "Kamus Hukum",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container())
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
                                  onFieldSubmitted: (value) {},
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
                            height: 18.0,
                          ),
                          // pakai pageview nuilder
                          const TitleKamusWidget(),
                          SizedBox(
                              height: 730,
                              width: MediaQuery.of(context).size.width,
                              child: PageView.builder(
                                controller: _controller,
                                //itemCount: _items.length,
                                itemCount: _items.length,
                                // onPageChanged: (int page) {
                                //   if (page >= _items.length - 1) {
                                //     // Approaching end of loaded items, fetch more
                                //     _currentPage++;
                                //     _loadPage(_currentPage);
                                //   }
                                // },
                                itemBuilder: (context, index) {
                                  //final Item kamus = state.data.items![index];
                                  final item = _items[index];

                                  return Column(
                                    children: [
                                      BodyKamusWidget(
                                          istilah: item.istilah.toString(),
                                          definisi: item.definisi.toString()),
                                      BodyKamusWidget(
                                          istilah: _items[1].istilah.toString(),
                                          definisi: item.definisi.toString()),
                                      BodyKamusWidget(
                                          istilah: _items[2].istilah.toString(),
                                          definisi: item.definisi.toString()),
                                    ],
                                  );
                                },
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
        bottomNavigationBar: SizedBox(
          height: 110,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  KamusSebelumnyaButtonWidget(
                      onTap: _currentPage > 1 ? _loadPreviousPage : null),
                  KamusSelanjutnyaButtonWidgetNew(onTap: _loadNextPage)
                  // KamusSelanjutnyaButtonWidget(
                  //   onTap: () {
                  //     page.animateToPage(pageIndex + 1,
                  //         duration: const Duration(milliseconds: 200),
                  //         curve: Curves.easeOut);
                  //     print(pageIndex);..
                  //     // page.animateToPage(pageIndex--,
                  //     //     duration: const Duration(milliseconds: 400),
                  //     //     curve: Curves.linearToEaseOut);
                  //   },
                  // )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Page",
                      style: TextStyle(
                        fontSize: 8.0,
                      ),
                    ),
                    const SizedBox(
                      width: 2.0,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Center(
                          child: Text(
                        "$_currentPage",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 11),
                      )),
                    ),
                    const SizedBox(
                      width: 2.0,
                    ),
                    const Text(
                      "Of",
                      style: TextStyle(
                        fontSize: 8.0,
                      ),
                    ),
                    const SizedBox(
                      width: 2.0,
                    ),
                    const Text(
                      "99",
                      style: TextStyle(
                        fontSize: 8.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // halaman sebelumnya
  void _loadPreviousPage() {
    if (_currentPage > 1) {
      _currentPage--;
      _controller.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      _loadItems(_currentPage);
    }
  }

  void _loadNextPage() {
    _currentPage++;
    _controller.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    _loadItems(_currentPage);
  }
}
