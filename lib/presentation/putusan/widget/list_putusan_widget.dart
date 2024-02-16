// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ListPutusanWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final String detail;
  final String date;
  final String readCount;
  final Function()? onTap;
  const ListPutusanWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.date,
    required this.readCount,
    this.onTap,
  }) : super(key: key);

  @override
  State<ListPutusanWidget> createState() => _ListPutusanWidgetState();
}

class _ListPutusanWidgetState extends State<ListPutusanWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.detail.length >= 100 ? 195 : 150,
        width: 361,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  offset: Offset(3, 3),
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
              height: widget.detail.length >= 100 ? 165 : 120,
              width: 361,
              //color: Colors.brown,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Stack(
                children: [
                  Container(
                    height: widget.detail.length >= 100 ? 165 : 120,
                    width: 341,
                    //color: Colors.yellow,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
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
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          widget.subtitle,
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          widget.detail,
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
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
              height: 30,
              width: 360,
              padding: const EdgeInsets.only(left: 20),
              decoration: const BoxDecoration(
                  color: Color(0xFFECF0F1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 140,
                    height: 30,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
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
                          Icons.remove_red_eye,
                          size: 8.0,
                        ),
                        const SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          widget.readCount,
                          style: const TextStyle(
                            fontSize: 9.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
