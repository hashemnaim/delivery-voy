import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPngImage extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final BoxFit? fit;
  CustomPngImage(this.imageName, {this.height, this.width, this.fit});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$imageName.png',
      height: height ?? 30.h,
      width: width ?? 30.w,
      fit: fit ?? BoxFit.contain,
    );
  }
}

class CustomSvgImage extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final Color? color;
  CustomSvgImage({this.imageName, this.height, this.width, this.color});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$imageName.svg',
      height: height ?? 22.h,
      width: width ?? 22.w,
      color: color,
      fit: BoxFit.contain,
    );
  }
}
