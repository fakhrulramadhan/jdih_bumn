import 'package:flutter/material.dart';

class InfoDetailMarginNoWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final double? heightTitle;
  const InfoDetailMarginNoWidget(
      {Key? key, required this.title, required this.subtitle, this.heightTitle})
      : super(key: key);

  @override
  State<InfoDetailMarginNoWidget> createState() =>
      _InfoDetailMarginNoWidgetState();
}

class _InfoDetailMarginNoWidgetState extends State<InfoDetailMarginNoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.heightTitle ?? 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0093AD)),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.subtitle,
              style:
                  const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          // Container(
          //   height: 5,
          //   width: MediaQuery.of(context).size.width * 0.8,
          //   color: const Color(0xff8BCBDA),
          // ),
          const Divider(
            color: Color(0xff8BCBDA),
          ),
          const SizedBox(
            height: 2.0,
          ),
        ],
      ),
    );
  }
}
