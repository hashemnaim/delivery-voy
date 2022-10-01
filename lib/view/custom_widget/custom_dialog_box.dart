import 'package:delivery_boy/values/export.dart';

import 'custom_button.dart';

class CustomDialogBox extends StatelessWidget {
  final Function? onPress;
  final String titel;
  final String button;

  CustomDialogBox(
    this.titel, {
    Key? key,
    this.onPress,
    this.button = "Logg inn",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.blackDark, width: 3)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomText(text: titel, color: Colors.black),
          SizedBox(
            height: ScreenUtil().setHeight(22),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                  color: AppColors.primary, text: button, onTap: () => onPress!()
                  //    Navigator.pop(context);

                  ),
              CustomButton(text: "Nei", onTap: () => Navigator.pop(context)),
            ],
          ),
        ],
      ),
    );
  }
}
