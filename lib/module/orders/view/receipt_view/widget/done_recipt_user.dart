import 'package:delivery_boy/translations/strings_enum.dart';
import 'package:get/get.dart';

import '../../../../../utils/export.dart';
import '../../../controller/controller_order.dart';
import '../../../server/server_order.dart';
import '../../../order_details_screen.dart';

class DoneReciptUser extends GetView<OrderController> {
  const DoneReciptUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90.w,
              child: Center(
                child: CustomText(
                    text: "في التوصيل",
                    fontSize: 22.sp,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(width: 10),
            if (controller.receiptDoneUserOrderModel.isNotEmpty)
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 7.h),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.receiptDoneUserOrderModel.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onDoubleTap: () async {
                            await ServerOrder.instance.changeStatus(
                                controller.receiptDoneUserOrderModel[index].id,
                                (int.parse(controller
                                            .receiptDoneUserOrderModel[index]
                                            .statusId!) +
                                        1)
                                    .toString());
                          },
                          onTap: () {
                            Get.to(() => OrderDetailsRecpitScreen(
                                  id: controller
                                      .receiptDoneUserOrderModel[index].id!,
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: DonWidget(index),
                          ));
                    }),
              )
            else
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: AppStrings.LaundryDelivery.tr,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 10.h)
          ],
        ),
      ),
    );
  }

  Widget DonWidget(int index) {
    return Card(
      color: AppColors.primary,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CustomText(
                  text: "#" + controller.receiptDoneUserOrderModel[index].code!,
                  fontSize: 20.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: CustomText(
                        text: controller.receiptDoneUserOrderModel[index]
                                .customer!.name ??
                            "",
                        fontSize: 15.sp,
                        maxLines: 1,
                        color: Colors.white)),
                SizedBox(height: 8.h),
                CustomText(
                  text: controller.receiptDoneUserOrderModel[index].total
                          .toString() +
                      " " +
                      AppStrings.currency.tr,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
