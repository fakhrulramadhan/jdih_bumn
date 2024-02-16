import 'package:flutter/material.dart';

class DisclaimerWidget extends StatefulWidget {
  const DisclaimerWidget({super.key});

  @override
  State<DisclaimerWidget> createState() => _DisclaimerWidgetState();
}

class _DisclaimerWidgetState extends State<DisclaimerWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 346,
        height: 126,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 9, 85),
            borderRadius: BorderRadius.circular(12)),
        child: const Row(
          children: [Column(), Column()],
        ),
      ),
    );
  }
}
