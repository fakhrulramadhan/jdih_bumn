import 'package:flutter/material.dart';

class InfoDetailStatusPeraturanWidget extends StatefulWidget {
  final String title;
  //final String subtitle;
  final Widget subWidget;
  final double? heightTitle;
  const InfoDetailStatusPeraturanWidget(
      {Key? key,
      required this.title,
      required this.subWidget,
      this.heightTitle})
      : super(key: key);

  @override
  State<InfoDetailStatusPeraturanWidget> createState() =>
      _InfoDetailStatusPeraturanWidgetState();
}

class _InfoDetailStatusPeraturanWidgetState
    extends State<InfoDetailStatusPeraturanWidget> {
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
          Align(alignment: Alignment.centerLeft, child: widget.subWidget),
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
