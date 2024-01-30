import 'package:flutter/material.dart';

class InfoDetailArtikelWidget extends StatefulWidget {
  final String partOf;
  final String title;

  const InfoDetailArtikelWidget({
    Key? key,
    required this.partOf,
    required this.title,
  }) : super(key: key);

  @override
  State<InfoDetailArtikelWidget> createState() =>
      _InfoDetailArtikelWidgetState();
}

class _InfoDetailArtikelWidgetState extends State<InfoDetailArtikelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Text(
              widget.partOf,
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          SizedBox(
            width: 0.1 * MediaQuery.of(context).size.width,
          ),
          const Text(
            ":",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 12.0,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
