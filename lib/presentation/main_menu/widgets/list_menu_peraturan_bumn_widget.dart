import 'package:flutter/material.dart';

class ListMenuPeraturanBumnWidget extends StatefulWidget {
  final VoidCallback onTap;
  //final String assetUrl;
  final String menuText;
  const ListMenuPeraturanBumnWidget({
    Key? key,
    required this.onTap,
    //required this.assetUrl,
    required this.menuText,
  }) : super(key: key);

  @override
  State<ListMenuPeraturanBumnWidget> createState() =>
      _ListMenuPeraturanBumnWidgetState();
}

class _ListMenuPeraturanBumnWidgetState
    extends State<ListMenuPeraturanBumnWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        height: 118,
        width: 72,
        child: Column(
          children: [
            SizedBox(
              height: 65,
              width: 70,
              child: Image.asset(
                "assets/images/peraturan_bumnd.png",
                width: 72.0,
                height: 65.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.menuText,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
