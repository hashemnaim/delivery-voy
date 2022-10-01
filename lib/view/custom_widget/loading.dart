import 'package:delivery_boy/values/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IsLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: AppColors.primary,
      size: 80.0,
    );
  }
}
