import 'package:flutter/material.dart';

class InfoDetailJudulArtikelWidget extends StatefulWidget {
  final String partOf;
  final String title;

  const InfoDetailJudulArtikelWidget({
    Key? key,
    required this.partOf,
    required this.title,
  }) : super(key: key);

  @override
  State<InfoDetailJudulArtikelWidget> createState() =>
      _InfoDetailJudulArtikelWidgetState();
}

class _InfoDetailJudulArtikelWidgetState
    extends State<InfoDetailJudulArtikelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 80,
                child: Text(
                  widget.partOf,
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
              SizedBox(
                width: 0.21 * MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 80,
                child: Text(
                  ":",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
