// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class BagikanButtonMonografiWidget extends StatefulWidget {
  final Function()? onPressed;
  const BagikanButtonMonografiWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<BagikanButtonMonografiWidget> createState() =>
      _BagikanButtonMonografiWidgetState();
}

class _BagikanButtonMonografiWidgetState
    extends State<BagikanButtonMonografiWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        child: OutlinedButton(
          onPressed: widget.onPressed,
          style: OutlinedButton.styleFrom(
              side: const BorderSide(
            color: Color(0xff0093AD),
          )),
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
