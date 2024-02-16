import 'package:flutter/material.dart';

class KamusSelanjutnyaButtonWidgetNew extends StatefulWidget {
  final void Function()? onTap;
  const KamusSelanjutnyaButtonWidgetNew({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<KamusSelanjutnyaButtonWidgetNew> createState() =>
      _KamusSelanjutnyaButtonWidgetNewState();
}

class _KamusSelanjutnyaButtonWidgetNewState
    extends State<KamusSelanjutnyaButtonWidgetNew> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
              color: const Color(0xff0093AD),
              // border: Border.all(
              //   color: const Color(0xff0093AD),w
              // ),
              borderRadius: BorderRadius.circular(5)),
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
