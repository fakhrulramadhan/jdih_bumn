import 'package:flutter/material.dart';

class InfoGrafisWidgetNew extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const InfoGrafisWidgetNew(
      {super.key, required this.text, required this.onTap});

  @override
  State<InfoGrafisWidgetNew> createState() => _InfoGrafisWidgetNewState();
}

class _InfoGrafisWidgetNewState extends State<InfoGrafisWidgetNew> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          height: 195,
          width: 150,
          // color: Colors.purple,
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 9, 85),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Image.asset(
                  "assets/images/infografis-remove.png",
                  width: 125.0,
                  height: 125.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
