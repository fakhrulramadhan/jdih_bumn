import 'package:flutter/material.dart';

class PopulerWidget extends StatefulWidget {
  final String judul;
  final String nosk;
  final String isi;
  final String tgl_publikasi;
  final String jml_dilihat;
  const PopulerWidget(
      {super.key,
      required this.judul,
      required this.nosk,
      required this.isi,
      required this.tgl_publikasi,
      required this.jml_dilihat});

  @override
  State<PopulerWidget> createState() => _PopulerWidgetState();
}

class _PopulerWidgetState extends State<PopulerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: 341,
      //margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            height: 180,
            width: 341,
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20),
            child: Stack(
              children: [
                SizedBox(
                  height: 160,
                  width: 341,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 260,
                        child: Text(
                          widget.judul,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0093AD),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.nosk,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.isi,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xFFECF0F1),
            height: 30,
            width: 341,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 8.0,
                ),
                const SizedBox(
                  width: 2.0,
                ),
                Text(
                  widget.tgl_publikasi,
                  style: const TextStyle(
                    fontSize: 9.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                const Icon(
                  Icons.remove_red_eye,
                  size: 8.0,
                ),
                const SizedBox(
                  width: 2.0,
                ),
                Text(
                  widget.jml_dilihat,
                  style: const TextStyle(
                    fontSize: 9.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
