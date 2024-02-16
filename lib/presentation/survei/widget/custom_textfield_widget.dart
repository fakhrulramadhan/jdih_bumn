import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const CustomTextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffC2C2C2),
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffC2C2C2)))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "$hintText Harap diisi";
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
