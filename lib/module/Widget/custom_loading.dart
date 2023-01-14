import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class CustomLoading extends StatelessWidget {
  CustomLoading({Key? key, this.height = 250, this.width = 250})
      : super(key: key);
  double height, width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lottie/editor_ifbtlmwg.json',
          alignment: Alignment.center,
          fit: BoxFit.fill,
          height: height,
          width: height),
    );
  }
}
