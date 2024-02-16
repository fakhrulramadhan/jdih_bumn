// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class BagikanButtonWidget extends StatefulWidget {
  final Function()? onPressed;
  const BagikanButtonWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<BagikanButtonWidget> createState() => _BagikanButtonWidgetState();
}

class _BagikanButtonWidgetState extends State<BagikanButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        child: OutlinedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(color: Color(0xff0093AD), width: 1)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)))),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bagikan",
                  style: TextStyle(fontSize: 12.0, color: Color(0xff0093AD)),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(Icons.share, size: 24.0, color: Color(0xff0093AD)),
              ],
            ),
          ),
        ));
  }
}
