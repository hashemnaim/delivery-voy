import 'package:delivery_boy/values/dimensions.dart';
import 'package:delivery_boy/values/export.dart';
import 'package:delivery_boy/view/custom_widget/custom_button.dart';

import 'package:get/get.dart';

class DeliveryDialog extends StatelessWidget {
  final Function onTap;
  // final OrderModel orderModel;
  final int index;
  final String? title;
  final double? totalPrice;

  DeliveryDialog(
      {required this.onTap,
      this.totalPrice,
      // this.orderModel,
      this.title,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),
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
                SizedBox(height: 20),
                Center(
                    child: Text(
                  totalPrice.toString() + " جنيه",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: AppColors.primary,
                      fontSize: 30,
                      fontFamily: "Cairo"),
                )),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                            height: 50,
                            colorText: AppColors.white,
                            color: AppColors.primary,
                            width: Get.width,
                            text: 'تم',
                            onTap: onTap)),
                  ],
                ),
              ],
            ),
            Positioned(
              right: -20,
              top: -20,
              child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.clear, size: Dimensions.PADDING_SIZE_LARGE),
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
