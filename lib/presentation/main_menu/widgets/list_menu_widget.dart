// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListMenuWidget extends StatefulWidget {
  final VoidCallback onTap;
  final String assetUrl;
  final String menuText;
  const ListMenuWidget({
    Key? key,
    required this.onTap,
    required this.assetUrl,
    required this.menuText,
  }) : super(key: key);

  @override
  State<ListMenuWidget> createState() => _ListMenuWidgetState();
}

class _ListMenuWidgetState extends State<ListMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        height: 118,
        width: 72,
        child: Column(
          children: [
            SizedBox(
                height: 72,
                width: 72,
                child: SvgPicture.asset(
                  widget.assetUrl,
                  fit: BoxFit.contain,
                )),
            Text(
              widget.menuText,
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//assets/images/Peraturan.svg
