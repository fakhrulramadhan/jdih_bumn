// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/parser.dart';
import 'package:jdih_bumn/bloc/stage/get_tentang_jdih/get_tentang_jdih_bloc.dart';
import 'package:jdih_bumn/presentation/home_screen/home_screen.dart';
import 'package:jdih_bumn/presentation/main_menu/main_menu_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../data/model/response/stage/tentang_jdih_response_model.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TentangJdihWidget extends StatefulWidget {
  const TentangJdihWidget({Key? key}) : super(key: key);

  @override
  State<TentangJdihWidget> createState() => _TentangJdihWidgetState();
}

class _TentangJdihWidgetState extends State<TentangJdihWidget> {
  //late ScrollController _scrollController;

  final List<String> _items = [];
  final bool _isLoading = true;

  //  final ScrollController _controller =
  //     ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

  @override
  void initState() {
    context.read<GetTentangJdihBloc>().add(DoGetTentangJdihEvent());
    //_fetchDataFromAPI();
    // _scrollController = ScrollController();

    super.initState();
  }

  String _parseHtmlString(String? htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  String removeAllHtmlTags(String? htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText!.replaceAll(exp, '');
  }

  // Future<void> _fetchDataFromAPI() async {
  //   final response = await http
  //       .get(Uri.parse('${Constants.baseUrlStage}/profil/tentang-jdih'));
  //   if (response.statusCode == 200) {
  //     // Parsing HTML dan ekstraksi elemen-elemen <li>
  //     dom.Document document = parser.parse(response.body);
  //     List<dom.Element> items = document.querySelectorAll('li');
  //     setState(() {
  //       _items = items.map((element) => element.text).toList();
  //       _isLoading = false;
  //     });
  //   } else {
  //     throw Exception('Failed to load data from API');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              height: 1040,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: BlocBuilder<GetTentangJdihBloc, GetTentangJdihState>(
                builder: (context, state) {
                  if (state is GetTentangJdihError) {
                    return const Center(
                      child: Text('data error'),
                    );
                  }

                  if (state is GetTentangJdihLoading) {
                    // return const Center(
                    //   child: CircularProgressIndicator(),
                    // );

                    return Skeletonizer(
                      enabled: true,
                      child: ListView.builder(
                        itemCount: 1,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          // final Item tentang_jdih = state.data.items![index];

                          // print("ini jumlah datanya ${state.data.items!.length}");
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "test",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              //"${removeAllHtmlTags(tentang_jdih.deskripsi)}"
                              const Text(
                                "Test",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.visible,
                              ),
                              const SizedBox(
                                height: 14.0,
                              ),
                              Container(
                                height: 1143,
                                width: 344,
                                color: Colors.yellow,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 1143,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            12.0,
                                          ),
                                        ),
                                        // image: DecorationImage(
                                        //     image: AssetImage(
                                        //         'assets/images/appbar-bg2.png'),
                                        //     fit: BoxFit.cover)
                                      ),
                                      child: Image.asset(
                                        "assets/images/appbar-bg2.png",
                                        // width: MediaQuery.of(context).size.width,
                                        // height: 1000,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      height: 1143,
                                      width: 344,
                                      //color: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      child: const Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              "VISI",
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "test",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              overflow: TextOverflow.visible,
                                              textAlign: TextAlign.justify,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1143,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 170.0,
                                          ),
                                          const Text(
                                            "MISI",
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          //semua tag html yang ada
                                          //di api, harus dimasukkin
                                          //ke style buat diatur styling
                                          //nya (margin / padding),
                                          //ternyata atur padding di ul nya
                                          Html(
                                            data: "test",
                                            style: {
                                              "li": Style(
                                                  fontSize: FontSize(12),
                                                  margin: Margins.zero,
                                                  padding: HtmlPaddings.zero,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.white,
                                                  textAlign: TextAlign.justify),
                                              "ul": Style(
                                                  margin: Margins.symmetric(
                                                      horizontal: 20),
                                                  padding: HtmlPaddings.zero),
                                              "span": Style(
                                                  margin: Margins.zero,
                                                  padding: HtmlPaddings.zero)
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: SvgPicture.asset(
                                              "assets/images/BUMN Background.svg",
                                              height: 153,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  }

                  if (state is GetTentangJdihLoaded) {
                    if (state.data.items!.isEmpty) {
                      return const Center(
                        child: Text("Data kosong"),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.data.items!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        final Item tentangJdih = state.data.items![index];

                        print("ini jumlah datanya ${state.data.items!.length}");
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${tentangJdih.judul}",
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            //"${removeAllHtmlTags(tentang_jdih.deskripsi)}"
                            Text(
                              _parseHtmlString(tentangJdih.deskripsi),
                              style: const TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.visible,
                            ),
                            const SizedBox(
                              height: 14.0,
                            ),
                            Container(
                              height: 1143,
                              width: 344,
                              //color: Colors.yellow,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 1143,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          12.0,
                                        ),
                                      ),
                                      // image: DecorationImage(
                                      //     image: AssetImage(
                                      //         'assets/images/appbar-bg2.png'),
                                      //     fit: BoxFit.cover)
                                    ),
                                    child: Image.asset(
                                      "assets/images/appbar-bg2.png",
                                      // width: MediaQuery.of(context).size.width,
                                      // height: 1000,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: 1143,
                                    width: 344,
                                    //color: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "VISI",
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            removeAllHtmlTags(tentangJdih.visi),
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1143,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 170.0,
                                        ),
                                        const Text(
                                          "MISI",
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        //semua tag html yang ada
                                        //di api, harus dimasukkin
                                        //ke style buat diatur styling
                                        //nya (margin / padding),
                                        //ternyata atur padding di ul nya
                                        Html(
                                          data: "${tentangJdih.misi}",
                                          style: {
                                            "li": Style(
                                                fontSize: FontSize(12),
                                                margin: Margins.zero,
                                                padding: HtmlPaddings.zero,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.white,
                                                textAlign: TextAlign.justify),
                                            "ul": Style(
                                                margin: Margins.symmetric(
                                                    horizontal: 20),
                                                padding: HtmlPaddings.zero),
                                            "span": Style(
                                                margin: Margins.zero,
                                                padding: HtmlPaddings.zero)
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: SvgPicture.asset(
                                            "assets/images/BUMN Background.svg",
                                            height: 153,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
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
            ),
          ),
        ),
        onWillPop: () async {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Maaf, tidak bisa ke halaman sebelumnya'),
          //     backgroundColor: Colors.red,
          //   ),
          // );

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => HomeScreen()),
          // );

          SystemNavigator.pop();
          return false;
        });
  }
}
