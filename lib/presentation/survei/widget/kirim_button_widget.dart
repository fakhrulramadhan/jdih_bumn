// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class KirimButtonWidget extends StatefulWidget {
  final Function()? onPressed;
  const KirimButtonWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<KirimButtonWidget> createState() => _KirimButtonWidgetState();
}

class _KirimButtonWidgetState extends State<KirimButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xff0093AD)),
          child: const Center(
            child: Text(
              "Kirim",
              style: TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          )),
    );
  }
}
