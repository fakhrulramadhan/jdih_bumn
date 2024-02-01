import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/body_kamus_page.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/body_kamus_page_two.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/widget/kamus_sebelumnya_button_widget.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/widget/kamus_selanjutnya_button_widget.dart';
import 'package:jdih_bumn/presentation/kamus_hukum/widget/title_kamus_widget.dart';

class KamusHukumScreen extends StatefulWidget {
  const KamusHukumScreen({super.key});

  @override
  State<KamusHukumScreen> createState() => _KamusHukumScreenState();
}

class _KamusHukumScreenState extends State<KamusHukumScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    PageController page = PageController(
      initialPage: 0,
      viewportFraction: 1,
    );

    @override
    void initState() {
      //context.read<GetPeraturanHukumBloc>().add(DoGetPeraturanHukumEvent());
      // TODO: implement initState
      super.initState();
    }

    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      //  kamus hukum pakai pagination, buat lihat data selanjutnya
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: SafeArea(
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: width,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                            child: Image.asset(
                              "assets/images/appbar-bg2.png",
                              width: width,
                              height: 100.0,
                              fit: BoxFit.none,
                            ),
                          ),
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
                                width:
                                    0.185 * MediaQuery.of(context).size.width,
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
                              Expanded(child: Container()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
                        child: SizedBox(
                          height: 45,
                          width: width * 0.8,
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
                                  contentPadding:
                                      const EdgeInsets.only(top: 10),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(7),
                                      ),
                                      borderSide: BorderSide.none),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 1)),
                                  hintText: '  Ketik kata kunci pencarian....',
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
                        child: PageView(
                          controller: page,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          pageSnapping: true,
                          // on page changed (ketika halamannya berubah)
                          onPageChanged: (newpage) {
                            //update ui halamannya ke berapa
                            setState(() {
                              pageIndex = newpage;
                            });
                          },
                          children: const [
                            BodyKamusPage(),
                            BodyKamusPageTwo(),
                            BodyKamusPage()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KamusSebelumnyaButtonWidget(
                  onTap: () {
                    print(page);
                    print(pageIndex);
                    page.animateToPage(pageIndex - 1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut);
                  },
                ),
                KamusSelanjutnyaButtonWidget(
                  onTap: () {
                    page.animateToPage(pageIndex + 1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut);
                    print(pageIndex);
                    // page.animateToPage(pageIndex--,
                    //     duration: const Duration(milliseconds: 400),
                    //     curve: Curves.linearToEaseOut);
                  },
                )
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
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                        child: Text(
                      "${pageIndex + 1}",
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
                    "10",
                    style: TextStyle(
                      fontSize: 8.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
