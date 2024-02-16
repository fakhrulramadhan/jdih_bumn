import 'package:flutter/material.dart';

class KamusSelanjutnyaButtonWidget extends StatefulWidget {
  final void Function()? onTap;
  const KamusSelanjutnyaButtonWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<KamusSelanjutnyaButtonWidget> createState() =>
      _KamusSelanjutnyaButtonWidgetState();
}

class _KamusSelanjutnyaButtonWidgetState
    extends State<KamusSelanjutnyaButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          width: 160,
          height: 50,
          color: const Color(0xff0093AD),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Selanjutnya",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(
                  Icons.arrow_right,
                  size: 24.0,
                  color: Colors.white,
                ),
              ],
            ),
          )),
    );
  }
}
