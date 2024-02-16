// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:jdih_bumn/presentation/artikel_detail/artikel_detail_screen.dart';

class ListArtikelWidget extends StatefulWidget {
  final String title;
  final String date;
  final String author;
  const ListArtikelWidget({
    Key? key,
    required this.title,
    required this.date,
    required this.author,
  }) : super(key: key);

  @override
  State<ListArtikelWidget> createState() => _ListArtikelWidgetState();
}

class _ListArtikelWidgetState extends State<ListArtikelWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ArtikelDetailScreen()),
        );
      },
      child: SizedBox(
        height: widget.title.length >= 100 ? 190 : 180,
        width: 460,
        child: Column(
          children: [
            Container(
              height: widget.title.length >= 100 ? 170 : 150,
              width: 460,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        offset: Offset(0, 3),
                        blurRadius: 2)
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Column(
                children: [
                  Container(
                    height: widget.title.length >= 100 ? 140 : 120,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.brown,
                    padding:
                        const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                    child: Stack(
                      children: [
                        Container(
                          height: widget.title.length >= 100 ? 150 : 120,
                          width: 341,
                          //color: Colors.yellow,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0093AD),
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.visible,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 460,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: const BoxDecoration(
                        color: Color(0xFFECF0F1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    child: Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      direction: Axis.horizontal, //
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
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
                                widget.date,
                                style: const TextStyle(
                                  fontSize: 9.0,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              const Icon(
                                Icons.people,
                                size: 8.0,
                              ),
                              const SizedBox(
                                width: 2.0,
                              ),
                              Expanded(
                                child: Text(
                                  widget.author,
                                  style: const TextStyle(
                                    fontSize: 9.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
