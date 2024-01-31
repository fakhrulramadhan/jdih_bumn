import 'package:flutter/material.dart';

class InfoDetailWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final double? heightTitle;
  const InfoDetailWidget(
      {Key? key, required this.title, required this.subtitle, this.heightTitle})
      : super(key: key);

  @override
  State<InfoDetailWidget> createState() => _InfoDetailWidgetState();
}

class _InfoDetailWidgetState extends State<InfoDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heightTitle ?? 110,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 20, right: 20),
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
              style: const TextStyle(
                fontSize: 12.0,
              ),
              overflow: TextOverflow.visible,
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
          // const SizedBox(
          //   height: 2.0,
          // ),
        ],
      ),
    );
  }
}
