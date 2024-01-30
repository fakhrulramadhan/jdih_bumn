import 'package:flutter/material.dart';

class DownloadButtonWidget extends StatefulWidget {
  final void Function()? onTap;
  const DownloadButtonWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<DownloadButtonWidget> createState() => _DownloadButtonWidgetState();
}

class _DownloadButtonWidgetState extends State<DownloadButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color(0xff0093AD),
        ),
        child: ElevatedButton(
            onPressed: widget.onTap,
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Download File",
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
                    Icons.download,
                    size: 24.0,
                    color: Colors.white,
                  ),
                ],
              ),
            )));
  }
}
