import 'package:google_fonts/google_fonts.dart';

import '../../utils/export.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final TextAlign? textAlign;
  final Color? color;

  final FontWeight? fontWeight;
  final int? maxLines;
  final double? letterSpacing;

  CustomText(
      {this.text,
      this.fontSize,
      this.textAlign,
      this.color,
      this.fontWeight,
      this.maxLines,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: GoogleFonts.cairo(
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 14.sp,
        height: 1.4.h,
        color: color ?? AppColors.bluColor,
        decoration: TextDecoration.none,
      ),
    );
  }
}
