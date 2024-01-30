import 'package:flutter/material.dart';

class BodyKamusWidget extends StatelessWidget {
  final String istilah;
  final String definisi;
  const BodyKamusWidget({
    Key? key,
    required this.istilah,
    required this.definisi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // enggak usah paki height karena nanti akan diatur sendiri
      //height: 140,
      width: MediaQuery.of(context).size.width * 0.9,
      color: Colors.white,
      // constraints: BoxConstraints(
      //     minHeight: 90,
      //     maxHeight: 170,
      //     minWidth: MediaQuery.of(context).size.width * 0.9),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //agar posisi columnya mulai dari atas
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 0.3 * MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    istilah,
                    style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
              SizedBox(
                width: 0.5 * MediaQuery.of(context).size.width,
                child: Text(
                  definisi,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.visible,
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
