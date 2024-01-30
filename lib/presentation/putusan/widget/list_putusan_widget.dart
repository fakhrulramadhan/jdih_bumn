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
      child: SizedBox(
        height: 330,
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
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          widget.detail,
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
              width: 360,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 140,
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
