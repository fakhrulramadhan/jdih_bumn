import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconInfoWidget extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  const IconInfoWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<IconInfoWidget> createState() => _IconInfoWidgetState();
}

class _IconInfoWidgetState extends State<IconInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 87.0,
        width: 100.0,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: const Color(0xffF5F5FF),
                  borderRadius: BorderRadius.circular(20)),
              child: SvgPicture.asset(
                widget.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 9.0,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff101010)),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.subtitle,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Color(0xff878787),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
