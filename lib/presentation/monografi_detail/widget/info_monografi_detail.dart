import 'package:flutter/material.dart';

class InfoMonografiDetailWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final double? heightTitle;
  const InfoMonografiDetailWidget(
      {Key? key, required this.title, required this.subtitle, this.heightTitle})
      : super(key: key);

  @override
  State<InfoMonografiDetailWidget> createState() =>
      _InfoMonografiDetailWidgetState();
}

class _InfoMonografiDetailWidgetState extends State<InfoMonografiDetailWidget> {
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
              ),
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
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
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
