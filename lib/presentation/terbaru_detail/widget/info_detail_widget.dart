import 'package:flutter/material.dart';

class InfoDetailTerbaruWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final double? heightTitle;
  const InfoDetailTerbaruWidget(
      {Key? key, required this.title, required this.subtitle, this.heightTitle})
      : super(key: key);

  @override
  State<InfoDetailTerbaruWidget> createState() =>
      _InfoDetailTerbaruWidgetState();
}

class _InfoDetailTerbaruWidgetState extends State<InfoDetailTerbaruWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heightTitle ?? 80,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 16.0,
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
              overflow: TextOverflow.fade,
              textAlign: TextAlign.justify,
            ),
          ),
          // const SizedBox(
          //   height: 5.0,
          // ),
          // Container(
          //   height: 5,
          //   width: MediaQuery.of(context).size.width * 0.8,
          //   color: const Color(0xff8BCBDA),
          // ),
          const Divider(
            color: Color(0xff8BCBDA),
          ),
          // const SizedBox(
          //   height: 2.0,
          // ),
        ],
      ),
    );
  }
}
