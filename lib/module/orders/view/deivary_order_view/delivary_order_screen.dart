import 'package:delivery_boy/module/orders/controller/controller_order.dart';
import 'package:delivery_boy/translations/strings_enum.dart';
import '../../../../../utils/export.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../order_details_screen.dart';

class DelivaryFromUserScreen extends GetView<OrderController> {
  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  //     new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: Column(children: [
                CustomText(
                    text: "قيد التجهيز",
                    color: AppColors.blackDark,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
                Divider(height: 8),
                Obx(() => controller.inProgreesLandryOrderModel.isNotEmpty
                    ? Container(
                        height: 120.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.inProgreesLandryOrderModel.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => OrderDetailsRecpitScreen(
                                        id: controller
                                            .inProgreesLandryOrderModel[index]
                                            .id!,
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(.0),
                                  child: InProgress(index),
                                ),
                                // DelivaryOrderWidget(

                                //   index: index,
                                //   orderModel:
                                //       controller.inProgreesLandryOrderModel,
                                // )
                              );
                            }),
                      )
                    : Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSvgImage(
                              imageName: "order_empty",
                              height: 100.h,
                              width: 200.w),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomText(
                              text: AppStrings.noRequests.tr,
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ))),
              ])),
              Expanded(
                  child: Column(children: [
                CustomText(
                    text: "قيد التوصيل للتسليم",
                    color: AppColors.blackDark,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
                Divider(height: 8),
                Obx(() => controller.inDelivaryOrderModel.isNotEmpty
                    ? Container(
                        height: 120.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.inDelivaryOrderModel.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    Get.to(() => OrderDetailsRecpitScreen(
                                          id: controller
                                              .inDelivaryOrderModel[index].id!,
                                        ));
                                  },
                                  child: DelivaryWidget(index));
                            }),
                      )
                    : Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            CustomSvgImage(
                                imageName: "order_empty",
                                height: 100.h,
                                width: 50.w),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: CustomText(
                                  text: "تسليم للعميل", fontSize: 20),
                            )
                          ]))),
              ])),
              Expanded(
                  child: Column(children: [
                CustomText(
                    text: "تم التسليم من قبل المندوب",
                    fontSize: 25.sp,
                    color: AppColors.blackDark,
                    fontWeight: FontWeight.w600),
                Divider(height: 8),
                Obx(() => controller.DoneOrderModel.isNotEmpty
                    ? Container(
                        height: 140.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.DoneOrderModel.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    Get.to(() => OrderDetailsRecpitScreen(
                                          id: controller
                                              .DoneOrderModel[index].id!,
                                        ));
                                  },
                                  child: DoneWidget(index));
                            }))
                    : Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            CustomSvgImage(
                                imageName: "order_empty",
                                height: 100.h,
                                width: 50.w)
                          ]))),
              ]))
            ])));
  }

  Widget DelivaryWidget(int index) {
    return Card(
        color: AppColors.primary2,
        margin: const EdgeInsets.all(4.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: CustomText(
                          text: "#" +
                              controller.inDelivaryOrderModel[index].code!,
                          fontSize: 20.sp,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(height: 8.h),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: CustomText(
                                text: controller.inDelivaryOrderModel[index]
                                        .customer!.name ??
                                    "",
                                fontSize: 18.sp,
                                maxLines: 1,
                                color: Colors.white)),
                        SizedBox(height: 8.h),
                        CustomText(
                            text: controller
                                .inDelivaryOrderModel[index].delivery_name!,
                            fontSize: 18.sp,
                            color: Colors.white)
                      ])
                ])));
  }

  Widget InProgress(int index) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
          color: AppColors.primary2,
          margin: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CustomText(
                          text: "#" +
                              controller
                                  .inProgreesLandryOrderModel[index].code!,
                          fontSize: 20.sp,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 4.h),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: CustomText(
                                  text: controller
                                          .inProgreesLandryOrderModel[index]
                                          .customer!
                                          .name ??
                                      "",
                                  fontSize: 18.sp,
                                  maxLines: 1,
                                  color: Colors.white)),
                          SizedBox(height: 8.h),
                          CustomText(
                              text: controller
                                      .inProgreesLandryOrderModel[index].total
                                      .toString() +
                                  " " +
                                  Constants.currency,
                              fontSize: 18.sp,
                              color: Colors.white)
                        ])
                  ]))),
    );
  }

  Widget DoneWidget(int index) {
    return Card(
        color: AppColors.green,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CustomText(
                        text: "#" + controller.DoneOrderModel[index].code!,
                        fontSize: 20.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 4.h),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                            text: controller
                                    .DoneOrderModel[index].customer!.name ??
                                "",
                            fontSize: 18.sp,
                            maxLines: 1,
                            color: Colors.white),
                        SizedBox(height: 4.h),
                        CustomText(
                            text: controller.DoneOrderModel[index].total
                                    .toString() +
                                " " +
                                Constants.currency,
                            fontSize: 16.sp,
                            color: Colors.white),
                        SizedBox(height: 4.h),
                        CustomText(
                            text:
                                controller.DoneOrderModel[index].delivery_name!,
                            fontSize: 16.sp,
                            color: Colors.white)
                      ])
                ])));
  }
}
