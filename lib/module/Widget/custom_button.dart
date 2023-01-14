import '../../utils/export.dart';

class CustomButton extends StatelessWidget {
  final String? text;

  final Function? onTap;
  final bool? isShowBorder;

  final double? height;
  final double? width;
  final Color color;
  final double fontText;
  final Color? colorText;

  CustomButton(
      {this.text,
      this.onTap,
      this.height,
      this.width,
      this.color = AppColors.primary,
      this.colorText,
      this.fontText = 16,
      this.isShowBorder});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: SizedBox(
        height: height!.h,
        width: width!.w,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: CustomText(
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontSize: fontText.sp,
                text: text ?? 'Send',
                color: colorText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
