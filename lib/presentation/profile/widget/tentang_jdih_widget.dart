// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jdih_bumn/bloc/stage/get_tentang_jdih/get_tentang_jdih_bloc.dart';
import 'package:jdih_bumn/constants/constants.dart';
import './unordered_list_widget.dart';
import '../../../data/model/response/stage/tentang_jdih_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TentangJdihWidget extends StatefulWidget {
  const TentangJdihWidget({Key? key}) : super(key: key);

  @override
  State<TentangJdihWidget> createState() => _TentangJdihWidgetState();
}

class _TentangJdihWidgetState extends State<TentangJdihWidget> {
  //late ScrollController _scrollController;

  List<String> _items = [];
  bool _isLoading = true;

  @override
  void initState() {
    context.read<GetTentangJdihBloc>().add(DoGetTentangJdihEvent());
    _fetchDataFromAPI();
    // _scrollController = ScrollController();

    super.initState();
  }

  String removeAllHtmlTags(String? htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText!.replaceAll(exp, '');
  }

  Future<void> _fetchDataFromAPI() async {
    final response = await http
        .get(Uri.parse('${Constants.baseUrlStage}/profil/tentang-jdih'));
    if (response.statusCode == 200) {
      // Parsing HTML dan ekstraksi elemen-elemen <li>
      dom.Document document = parser.parse(response.body);
      List<dom.Element> items = document.querySelectorAll('li');
      setState(() {
        _items = items.map((element) => element.text).toList();
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              height: 1100,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: BlocBuilder<GetTentangJdihBloc, GetTentangJdihState>(
                builder: (context, state) {
                  if (state is GetTentangJdihLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is GetTentangJdihError) {
                    return const Center(
                      child: Text('data error'),
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
                        final Item tentang_jdih = state.data.items![index];

                        print("ini jumlah datanya ${state.data.items!.length}");
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${tentang_jdih.judul}",
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "${removeAllHtmlTags(tentang_jdih.deskripsi)}",
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
                                        vertical: 20, horizontal: 10),
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
                                            "${removeAllHtmlTags(tentang_jdih.visi)}",
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 20.0,
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
                                          Html(
                                            data: "${tentang_jdih.misi}",
                                            style: {
                                              "li": Style(
                                                  fontSize: FontSize(12),
                                                  margin: Margins.all(0),
                                                  padding:
                                                      HtmlPaddings.symmetric(
                                                          vertical: 0,
                                                          horizontal: 0),
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.white)
                                            },
                                          ),
                                          // HtmlWidget(
                                          //   "${tentang_jdih.misi}",

                                          //   textStyle: TextStyle(
                                          //       color: Colors.white,
                                          //       fontSize: 8),

                                          // ),
                                          // UnorderedListWidget([
                                          //   "Menjamin terciptanya pengelolaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN yang terpadu dan terintegrasi",
                                          //   "Menjamin ketersediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN yang lengkap dan akurat, serta dapat diakses secara cepat dan mudah",
                                          //   "Mengembangkan kerja sama yang efektif antara Pusat JDIH dan Anggota JDIH serta antar sesama Anggota JDIH dalam rangka penyediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN",
                                          //   "Mengembangkan kerja sama yang efektif antara Pusat JDIH dan Anggota JDIH serta antar sesama Anggota JDIH dalam rangka penyediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN"
                                          // ]
                                          // )

                                          //  UnorderedListItem(
                                          //     "Menjamin terciptanya pengelolaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN yang terpadu dan terintegrasi"),
                                          // const SizedBox(
                                          //   height: 5.0,
                                          // ),
                                          // const UnorderedListItem(
                                          //     "Menjamin ketersediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN yang lengkap dan akurat, serta dapat diakses secara cepat dan mudah"
                                          //     "Menjamin ketersediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN yang lengkap dan akurat, serta dapat diakses secara cepat dan mudah"),
                                          // const SizedBox(
                                          //   height: 5.0,
                                          // ),
                                          // const UnorderedListItem(
                                          //     "Mengembangkan kerja sama yang efektif antara Pusat JDIH dan Anggota JDIH serta antar sesama Anggota JDIH dalam rangka penyediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN"),
                                          // const SizedBox(
                                          //   height: 5.0,
                                          // ),
                                          // const UnorderedListItem(
                                          //     "Mengembangkan kerja sama yang efektif antara Pusat JDIH dan Anggota JDIH serta antar sesama Anggota JDIH dalam rangka penyediaan dokumentasi dan informasi hukum terkait Kementerian BUMN dan BUMN"),
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
                                    ),
                                  ),
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
