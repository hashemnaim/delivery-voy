import 'package:delivery_boy/values/export.dart';

class CustomButton extends StatelessWidget {
  final String? text;

  final Function? onTap;
  final bool? isShowBorder;

  final double? height;
  final double? width;
  final Color color;
  final Color? colorText;

  CustomButton(
      {this.text,
      this.onTap,
      this.height,
      this.width,
      this.color = AppColors.primary,
      this.colorText,
      this.isShowBorder});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap as void Function()?,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0.4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: SizedBox(
        height: height!.h,
        width: width!.w,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: CustomText(
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
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
