import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/peraturan/widget/list_peraturan_widget.dart';

class PeraturanScreen extends StatefulWidget {
  const PeraturanScreen({super.key});

  @override
  State<PeraturanScreen> createState() => _PeraturanScreenState();
}

class _PeraturanScreenState extends State<PeraturanScreen> {
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
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: SafeArea(
          child: Container(
            color: Colors.white,
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
                                    0.195 * MediaQuery.of(context).size.width,
                              ),
                              const Expanded(
                                child: SizedBox(
                                  height: 90,
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      "Peraturan",
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
                        height: 20.0,
                      ),
                      const ListPeraturanWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
