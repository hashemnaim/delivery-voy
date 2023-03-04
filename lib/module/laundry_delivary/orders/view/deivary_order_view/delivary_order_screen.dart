import 'package:delivery_boy/module/laundry_delivary/orders/controller/controller_order.dart';
import 'package:delivery_boy/translations/strings_enum.dart';
import '../../../../../../utils/export.dart';
import 'package:get/get.dart';
import '../receipt_view/screen/order_details_screen.dart';
import '../receipt_view/widget/item_delivary_order.dart';

class DelivaryFromUserScreen extends GetView<OrderController> {
  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  //     new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
                      CustomText(
                          text: AppStrings.Laundry.tr,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                      Divider(),
                      Obx(() => Expanded(
                          flex: 5,
                          child: controller.delivaryLandrOrderModel.isNotEmpty
                              ? ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount:
                                      controller.delivaryLandrOrderModel.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          Get.to(() => OrderDetailsRecpitScreen(
                                                id: controller
                                                    .delivaryLandrOrderModel[
                                                        index]
                                                    .id!,
                                              ));
                                        },
                                        child: DelivaryOrderWidget(
                                            index: index,
                                            orderModel: controller
                                                .delivaryLandrOrderModel));
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
                                          fontSize: 30),
                                    ),
                                  ],
                                )))),
                      // Divider(),
                      // DoneDelivryUser(),
                    ]))));
  }
}
