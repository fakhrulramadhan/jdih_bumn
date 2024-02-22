import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import './widget/list_monografi_widget.dart';

class MonografiScreen extends StatefulWidget {
  const MonografiScreen({super.key});

  @override
  State<MonografiScreen> createState() => _MonografiScreenState();
}

class _MonografiScreenState extends State<MonografiScreen> {
  final _scrollController = ScrollController();

  // void _onScroll() {
  //   final maxScroll = _scrollController.position.maxScrollExtent;
  //   final currentScroll = _scrollController.offset;
  //   if (currentScroll >= (maxScroll * 0.9)) {
  //     context.read<PostsBloc>().add(GetPostsEvent());
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // monografi ambil apinya dari service-jdihn (produkhukum)

    @override
    void initState() {
      // context.read<GetProdukHukumBloc>().add(DoGetProdukHukumEvent());
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
        body: DynMouseScroll(
      builder: (context, controller, physics) => ListView(
        controller: controller,
        physics: physics,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          SafeArea(
              child: Stack(
            children: [
              Image.asset(
                "assets/images/appbar-bg2.png",
                width: width,
                height: 110.0,
                fit: BoxFit.none,
              ),
              SizedBox(
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
                            width: 100,
                            child: Center(
                              child: Text(
                                "Monografi",
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
                      width: MediaQuery.of(context).size.width,
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

                          //const MonografiWidget()
                          const ListMonografiWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
        ],
      ),
    ));
  }
}
