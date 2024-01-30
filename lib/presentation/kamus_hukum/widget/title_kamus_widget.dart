import 'package:flutter/material.dart';

class TitleKamusWidget extends StatelessWidget {
  const TitleKamusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.9,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 0.3 * MediaQuery.of(context).size.width,
                child: const Text(
                  "Istilah",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff0093AD),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 0.5 * MediaQuery.of(context).size.width,
                child: const Text(
                  "Definisi",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0093AD),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 3.0,
          ),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
