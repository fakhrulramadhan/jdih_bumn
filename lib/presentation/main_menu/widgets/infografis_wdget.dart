// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class InfografisWidget extends StatefulWidget {
  final String text;
  //final String image;
  const InfografisWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<InfografisWidget> createState() => _InfografisWidgetState();
}

class _InfografisWidgetState extends State<InfografisWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195,
      height: 150,
      //padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(1, 152, 152, 152),
        borderRadius: BorderRadius.circular(12),
      ),
      // child: Column(
      //   children: [
      //     Text(
      //       widget.text,
      //       style: const TextStyle(
      //         fontSize: 12.0,
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 8.0,
      //     ),
      //     Image.asset(
      //       "assets/images/garuda.jpg",
      //       width: 40.0,
      //       height: 40.0,
      //       fit: BoxFit.fill,
      //     ),
      //   ],
      // ),
    );
  }
}
