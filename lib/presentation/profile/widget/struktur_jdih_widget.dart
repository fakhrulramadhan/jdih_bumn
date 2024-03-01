import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/home_screen/home_screen.dart';
import 'package:jdih_bumn/presentation/profile/widget/organisasi_widget.dart';
import 'package:jdih_bumn/presentation/profile/widget/pengelolaan_widget.dart';

class StrukturJdihWidget extends StatefulWidget {
  const StrukturJdihWidget({super.key});

  @override
  State<StrukturJdihWidget> createState() => _StrukturJdihWidgetState();
}

class _StrukturJdihWidgetState extends State<StrukturJdihWidget> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isToggled = false;

    PageController page = PageController(
      initialPage: 0,
      viewportFraction: 1,
    );

    return WillPopScope(
        child: Scaffold(
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              height: 540, //550 :770
              width: width,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FlutterSwitch(
                  //   height: 20.0,
                  //   width: 40.0,
                  //   padding: 4.0,
                  //   toggleSize: 20,
                  //   borderRadius: 10.0,
                  //   activeColor: Colors.cyan,
                  //   value: isToggled,
                  //   //showOnOff: true,
                  //   onToggle: (value) {
                  //     setState(() {
                  //       isToggled = !value;
                  //     });
                  //   },
                  // ),
                  //ButtonNextWidget(),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        width: 202,
                        height: 40,
                        // padding:
                        //     EdgeInsetsDirectional.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                offset: Offset(2, 2),
                                blurRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(49),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                print(page);
                                print(pageIndex);
                                page.animateToPage(pageIndex - 1,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeOut);

                                print(pageIndex);
                              },
                              child: Container(
                                height: 90,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  //awal pageindexnya 0,
                                  //berari ada di halaman 1
                                  color: pageIndex == 0
                                      ? Colors.cyan
                                      : Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "Organisasi",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color: pageIndex == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                                page.animateToPage(pageIndex + 1,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeOut);

                                print(pageIndex);
                              },
                              child: Container(
                                height: 90,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: pageIndex == 1
                                      ? Colors.cyan
                                      : Colors.white,
                                  //untuk kasih warna border
                                ),
                                child: Center(
                                  child: Text(
                                    "Pengelolaan",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color: pageIndex == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  // const SizedBox(
                  //   height: 5.0,
                  // ),
                  // Center(
                  //     child: Text(
                  //   "${pageIndex + 1}",
                  //   textAlign: TextAlign.center,
                  //   style: const TextStyle(fontSize: 11),
                  // )),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 445,
                    child: PageView(
                      controller: page,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      onPageChanged: (newpage) {
                        setState(() {
                          pageIndex = newpage;
                        });
                      },
                      children: const [
                        OrgansisasiWidget(),
                        PengelolaanWidget()
                      ],
                    ),
                  )
                ],
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          return false;
        });
  }
}
