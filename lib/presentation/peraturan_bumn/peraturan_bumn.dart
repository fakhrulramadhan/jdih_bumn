import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/peraturan_bumn/widget/list_peraturan_bumn_widgets.dart';
import 'package:jdih_bumn/presentation/peraturan_bumn_detail/peraturan_bumn_detail_screen.dart';

class PerarturanBumnScreen extends StatefulWidget {
  const PerarturanBumnScreen({super.key});

  @override
  State<PerarturanBumnScreen> createState() => _PerarturanBumnScreenState();
}

class _PerarturanBumnScreenState extends State<PerarturanBumnScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    @override
    void initState() {
      //context.read<GetPeraturanHukumBloc>().add(DoGetPeraturanHukumEvent());
      // TODO: implement initState
      super.initState();
    }

    final TextEditingController searchController = TextEditingController();
    return Scaffold(
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
                      // back button
                      BackButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 0.155 * MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(
                        height: 90,
                        width: 160,
                        child: Center(
                          child: Text(
                            "Peraturan BUMN",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
                          child: SizedBox(
                            height: 45,
                            width: width * 0.9,
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            color: Colors.black38, width: 1)),
                                    hintText:
                                        '  Ketik kata kunci pencarian....',
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
                        // const ListPeraturanBumnWidget(),
                        ListPeraturanBumnsWidget(
                          title: "Peraturan Menteri BUMN",
                          subtitle: "PER-01/MBU/2011",
                          detail:
                              "Penerapan Tata Kelola Perusahaan Yang Baik (Good Corporate Governance) Pada Badan Usaha Milik Negara",
                          date: "06-12-2023",
                          readCount: "2.731 K",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PeraturanBumnDetailScreen()),
                            );
                          },
                        ),
                        ListPeraturanBumnsWidget(
                          title: "Surat Edaran Menteri BUMN",
                          subtitle: "SE-7/MBU/07/2020",
                          detail:
                              "Nilai-nilai Utama (Core Values) Sumber Daya Manusia Badan Usaha Milik Negara",
                          date: "06-12-2023",
                          readCount: "2.731 K",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PeraturanBumnDetailScreen()),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
