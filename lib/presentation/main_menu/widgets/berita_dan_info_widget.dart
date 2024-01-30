// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class BeritaDanInfoWidget extends StatefulWidget {
  final String title;
  final String waktu;
  final VoidCallback onTap;

  const BeritaDanInfoWidget(
      {Key? key, required this.title, required this.waktu, required this.onTap})
      : super(key: key);

  @override
  State<BeritaDanInfoWidget> createState() => _BeritaDanInfoWidgetState();
}

class _BeritaDanInfoWidgetState extends State<BeritaDanInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Center(
        child: Container(
          height: 170,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 10),
          color: Colors.yellow[50],
          child: Column(
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 0, 9, 85),
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(
                  widget.waktu,
                  style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.asset(
                  "assets/images/beritainfo.png",
                  width: 150.0,
                  height: 90.0,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
