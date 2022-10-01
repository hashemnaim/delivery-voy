import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_image.dart';

class LogoApp extends StatelessWidget {
  final double? width;
  final double? height;
  LogoApp({this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo1',
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        return CustomPngImage(
          'logo1',
          width: width ?? 227.w,
          height: height ?? 267.h,
        );
      },
      child: CustomPngImage(
        'logo1',
        width: width ?? 227.w,
        height: height ?? 267.h,
      ),
    );
  }
}
