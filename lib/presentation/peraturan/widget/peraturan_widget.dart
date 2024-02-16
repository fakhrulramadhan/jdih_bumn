import 'package:flutter/material.dart';

class PeraturanWidget extends StatefulWidget {
  final String? judul;
  final String? nosk;
  final String? isi;
  final String? tgl_publikasi;
  final String? jml_dilihat;
  const PeraturanWidget(
      {super.key,
      this.judul,
      this.nosk,
      this.isi,
      this.tgl_publikasi,
      this.jml_dilihat});

  @override
  State<PeraturanWidget> createState() => _PeraturanWidgetState();
}

class _PeraturanWidgetState extends State<PeraturanWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: 361,
      child: Column(
        children: [
          Container(
            height: 260,
            width: 361,
            //color: Colors.brown,
            padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
            child: Stack(
              children: [
                Container(
                  height: 260,
                  width: 341,
                  //color: Colors.yellow,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.judul ?? '',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0093AD),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.nosk ?? '',
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
                        widget.isi ?? '',
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
                Container(
                  height: 130,
                  width: 341,
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 37,
                      width: 80,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(0),
                            topRight: Radius.circular(8)),
                        color: Color(0xFF0093AD),
                      ),
                      child: const Center(
                        child: Text(
                          "Berlaku",
                          style: TextStyle(
                            fontSize: 8.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: const Color(0xFFECF0F1),
            height: 30,
            width: 341,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 8.0,
                ),
                const SizedBox(
                  width: 2.0,
                ),
                Text(
                  widget.tgl_publikasi ?? '',
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
                  widget.jml_dilihat ?? '',
                  style: const TextStyle(
                    fontSize: 9.0,
                  ),
                ),
                SizedBox(
                  width: 0.25 * MediaQuery.of(context).size.width,
                ),
                const Icon(
                  Icons.picture_as_pdf,
                  size: 9.0,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 2.0,
                ),
                const Text(
                  "Full Teks",
                  style: TextStyle(
                    fontSize: 9.0,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Icon(
                  Icons.list,
                  size: 9.0,
                  color: Color(0xFF0093AD),
                ),
                const SizedBox(
                  width: 2.0,
                ),
                const Text(
                  "Rincian",
                  style: TextStyle(fontSize: 8.0, color: Color(0xFF0093AD)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
