import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jdih_bumn/presentation/survei/widget/custom_textfield_widget.dart';
import 'package:jdih_bumn/presentation/survei/widget/kirim_button_widget.dart';

class SurveiScreen extends StatefulWidget {
  const SurveiScreen({super.key});

  @override
  State<SurveiScreen> createState() => _SurveiScreenState();
}

class _SurveiScreenState extends State<SurveiScreen> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final TextEditingController searchController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController suggestController = TextEditingController();
    final ratingFormKey = GlobalKey<FormState>();

    late final TextEditingController ratingController;

    var ratingController0 = TextEditingController();
    bool isRTLMode0 = false;

    IconData? selectedIcon;

    @override
    void initState() {
      //context.read<GetPeraturanHukumBloc>().add(DoGetPeraturanHukumEvent());
      // TODO: implement initState
      ratingController = TextEditingController(text: '3.0');

      ratingController.text = "3.0";
      super.initState();
    }

    return Scaffold(
      //  kamus hukum pakai pagination, buat lihat data selanjutnya
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
                          Image.asset(
                            "assets/images/appbar-bg2.png",
                            width: width,
                            height: 100.0,
                            fit: BoxFit.none,
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
                                      "Survei",
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 350,
                          width: 350,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 350,
                                width: 350,
                                child: SvgPicture.asset(
                                    "assets/images/survei rating.svg"),
                              ),
                              SizedBox(
                                height: 350,
                                width: 350,
                                child: Center(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 90.0,
                                      ),
                                      const Text(
                                        "Rating",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      const Text(
                                        "4.8",
                                        style: TextStyle(
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 1.0,
                                      ),
                                      const Text(
                                        "40 Responden",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      RatingBarIndicator(
                                        rating: 4.8,
                                        itemBuilder: (context, index) => Icon(
                                          selectedIcon ?? Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 23.0,
                                        unratedColor:
                                            Colors.amber.withAlpha(50),
                                        direction: Axis.horizontal,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Center(
                            child: Column(
                          children: [
                            CustomTextFieldWidget(
                              controller: nameController,
                              hintText: "Nama Anda",
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFieldWidget(
                                controller: emailController,
                                hintText: "E-mail Anda"),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Beri Rating",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RatingBar.builder(
                                  minRating: 1,
                                  allowHalfRating: true,
                                  itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        size: 24.0,
                                        color: Colors.amber,
                                      ),
                                  onRatingUpdate: (rating) => setState(() {
                                        this.rating = rating;
                                      })),
                            ),
                            // const SizedBox(
                            //   height: 8.0,
                            // ),
                            // Text(
                            //   "Rating $rating",
                            //   style: const TextStyle(
                            //     fontSize: 12.0,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFieldWidget(
                              controller: suggestController,
                              hintText: "Kritik dan Saran",
                              maxLines: 5,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [KirimButtonWidget()],
        ),
      ),
    );
  }
}
