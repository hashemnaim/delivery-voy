import 'package:delivery_boy/translations/strings_enum.dart';
import 'package:get/get.dart';
import '../../../../../utils/export.dart';
import '../../controller/controller_order.dart';
import '../../order_details_screen.dart';
import '../../server/server_order.dart';

class DoneDelivryUser extends GetView<OrderController> {
  const DoneDelivryUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          width: 80,
          child: Center(
              child: CustomText(
                  text: "تسليم العميل",
                  fontSize: 20.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600))),
      SizedBox(width: 10),
      Obx(() => controller.inDelivaryOrderModel.isNotEmpty
          ? Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 7.h),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.inDelivaryOrderModel.length,
                  itemBuilder: (context, index) {
                    // Comparator<Processing> sortById =
                    //     (a, b) => b.time!.compareTo(a.time!);

                    return InkWell(
                        onDoubleTap: () async {
                          await ServerOrder.instance.changeStatus(
                              controller.inDelivaryOrderModel[index].id,
                              (int.parse(controller.inDelivaryOrderModel[index]
                                          .statusId!) +
                                      1)
                                  .toString());
                        },
                        onTap: () {
                          Get.to(() => OrderDetailsRecpitScreen(
                                id: controller.inDelivaryOrderModel[index].id!,
                              ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: DonWidget(index),
                        ));
                  }))
          : Expanded(
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomText(
                          text: AppStrings.deliveredUserDone.tr,
                          fontSize: 18.sp))))),
      SizedBox(height: 10.h)
    ]));
  }

  Widget DonWidget(int index) {
    return Card(
      color: AppColors.primary,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CustomText(
                  text: "#" + controller.inDelivaryOrderModel[index].code!,
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
                        text: controller
                                .inDelivaryOrderModel[index].customer!.name ??
                            "",
                        fontSize: 15.sp,
                        maxLines: 1,
                        color: Colors.white)),
                SizedBox(height: 2.h),
                CustomText(
                  text:
                      controller.inDelivaryOrderModel[index].total.toString() +
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
