import 'package:flutter/material.dart';

class RatingBarWidget extends StatefulWidget {
  const RatingBarWidget({super.key});

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  var ratingController = TextEditingController();
  late double rating;
  int ratingBarMode = 1;
  bool isRTLMode = false;
  bool isVertical = false;
  late IconData _selectedIcon;

  @override
  void initState() {
    ratingController.text = "3.0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        // body: SingleChildScrollView(
        // child: Container(
        // padding: const EdgeInsets.all(20.0),
        // child: const Column(
        // children: [],
        // ),
        // ),
        // ),
      ),
    );
  }
}
