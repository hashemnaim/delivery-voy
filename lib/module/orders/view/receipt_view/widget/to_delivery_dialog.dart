import 'package:delivery_boy/module/Widget/custom_button.dart';
import 'package:delivery_boy/translations/strings_enum.dart';

import 'package:get/get.dart';

import '../../../../../utils/export.dart';
import '../../../controller/controller_order.dart';
import '../../../model/customer_model.dart';
import 'custom_drop_down.dart';

class ToSelectDeliveryDialog extends StatefulWidget {
  final Function onTap;

  final String? textButton;
  final int index;
  final String? title;
  final String? totalPrice;

  ToSelectDeliveryDialog(
      {required this.onTap,
      this.totalPrice,
      this.textButton,
      this.title,
      required this.index});

  @override
  State<ToSelectDeliveryDialog> createState() => _ToDeliveryDialogState();
}

class _ToDeliveryDialogState extends State<ToSelectDeliveryDialog> {
  OrderController orderController = Get.find();

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
                Center(
                  child: CustomText(
                      text: "المندوب", fontSize: 24, color: AppColors.primary),
                ),
                SizedBox(height: 10),
                Obx(() => CustomDropDown(
                      itemsList: orderController.delivaryModel,
                      hint: orderController.delivaryId.value.name,
                      hintColor: Colors.black,
                      iconColor: Colors.black,
                      backgroundColor: Colors.grey[100],
                      onChanged: (DelivaryModel? value) {
                        orderController.delivaryId.value = value!;
                      },
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
                            text: "تأكيد",
                            onTap: widget.onTap)),
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
