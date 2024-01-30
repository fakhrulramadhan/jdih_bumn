import 'package:flutter/material.dart';

class MonografiWidget extends StatefulWidget {
  final Function()? onTap;
  const MonografiWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<MonografiWidget> createState() => _MonografiWidgetState();
}

class _MonografiWidgetState extends State<MonografiWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 290,
        width: 170,
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffEBEBF9)),
        child: Column(
          children: [
            const Text(
              "Hukum Acara Peradilan Tata Usaha Negara",
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
                "Penerbit : Pradnya Paramita",
                style: TextStyle(
                  fontSize: 8.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                "assets/images/lorem-book-ori-removebg.png",
                width: 127.0,
                height: 158.0,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
