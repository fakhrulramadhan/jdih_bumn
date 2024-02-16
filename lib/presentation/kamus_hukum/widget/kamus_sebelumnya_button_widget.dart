import 'package:flutter/material.dart';

class KamusSebelumnyaButtonWidget extends StatefulWidget {
  final void Function()? onTap;
  const KamusSebelumnyaButtonWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<KamusSebelumnyaButtonWidget> createState() =>
      _KamusSebelumnyaButtonWidgetState();
}

class _KamusSebelumnyaButtonWidgetState
    extends State<KamusSebelumnyaButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff0093AD),
              ),
              borderRadius: BorderRadius.circular(5)),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 24.0,
                  color: Color(0xff0093AD),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Sebelumnya",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0093AD),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
