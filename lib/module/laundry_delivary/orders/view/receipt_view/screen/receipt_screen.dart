import 'package:delivery_boy/module/laundry_delivary/orders/controller/controller_order.dart';
import 'package:delivery_boy/translations/strings_enum.dart';
import '../../../../../../utils/export.dart';
import 'package:get/get.dart';

import '../widget/done_recipt_user.dart';
import '../widget/item_order.dart';
import 'order_details_screen.dart';

class ReceiptFromUserScreen extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 8.h),
              CustomText(
                  text: AppStrings.Customer.tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
              Divider(),
              Expanded(
                  flex: 5,
                  child: Obx(() => controller.receiptUserOrderModel.isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.receiptUserOrderModel.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Get.to(() => OrderDetailsRecpitScreen(
                                      id: controller
                                          .receiptUserOrderModel[index].id!));
                                },
                                child: OrderWidget(
                                  index: index,
                                  orderModel: controller.receiptUserOrderModel,
                                ));
                          })
                      : Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSvgImage(
                                imageName: "order_empty",
                                height: 300.h,
                                width: 300.w),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: CustomText(
                                text: AppStrings.noRequests.tr,
                                color: AppColors.blackDark,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        )))),
              Divider(),
              DoneReciptUser(),
            ])));
  }
}
