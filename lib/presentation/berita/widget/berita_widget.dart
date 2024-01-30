import 'package:flutter/material.dart';

class BeritaWidget extends StatefulWidget {
  final Function()? onTap;
  const BeritaWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<BeritaWidget> createState() => _BeritaWidgetState();
}

class _BeritaWidgetState extends State<BeritaWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 240,
        width: 180,
        //padding: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 2)
            ]),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/berita-satu.png",
                width: 180.0,
                height: 122.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "11 Dec 2023",
                style: TextStyle(
                  fontSize: 8.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const Text(
              "IRH Kementerian BUMN Tahun 2023 Dinilai Istimewa",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
              overflow: TextOverflow.visible,
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Baca Selengkapnya....",
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue),
              ),
            ),
            // const SizedBox(
            //   height: 15.0,
            // ),
          ],
        ),
      ),
    );
  }
}
