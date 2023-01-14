import 'package:delivery_boy/module/Widget/custom_button.dart';
import 'package:delivery_boy/translations/strings_enum.dart';

import 'package:get/get.dart';

import '../../../../../../utils/export.dart';

class DeliveryDialog extends StatelessWidget {
  final Function onTap;
  final Function onTap2;
  final String? textButton;
  final int index;
  final String? title;
  final String? totalPrice;

  DeliveryDialog(
      {required this.onTap,
      required this.onTap2,
      this.totalPrice,
      this.textButton,
      this.title,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 0.2)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                    backgroundColor: AppColors.green,
                    radius: 40,
                    child: Icon(
                      Icons.done,
                      size: 60,
                      color: Colors.white,
                    )),
                SizedBox(height: 20),
                Center(
                  child: CustomText(
                      text: title, fontSize: 20, color: AppColors.primary),
                ),
                if (totalPrice == "")
                  Container()
                else
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Center(
                          child: Text(
                        totalPrice!,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: AppColors.primary,
                            fontSize: 30,
                            fontFamily: "Cairo"),
                      )),
                    ],
                  ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                            height: 50,
                            colorText: AppColors.white,
                            color: AppColors.primary,
                            width: Get.width,
                            text: textButton,
                            onTap: onTap)),
                    index == 0
                        ? Expanded(
                            child: CustomButton(
                                height: 50,
                                colorText: AppColors.white,
                                color: AppColors.primary,
                                width: Get.width,
                                text: AppStrings.noReceived.tr,
                                onTap: onTap2))
                        : SizedBox.shrink(),
                  ],
                ),
              ],
            ),
            Positioned(
              right: -20,
              top: -20,
              child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.clear, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
