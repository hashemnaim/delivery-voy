import 'dart:developer';
import 'dart:math' as math;

import 'package:delivery_boy/translations/strings_enum.dart';
import 'package:get/get.dart';

import '../../../model/detailsProduct_model.dart';
import '../../../../../../utils/export.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../main_screen.dart';
import 'delivery_dialog.dart';
import 'slider_button.dart';
import '../../../server/server_order.dart';

// ignore: must_be_immutable
class BottunChangeStatus extends StatelessWidget {
  BottunChangeStatus({
    Key? key,
    required this.data,
  }) : super(key: key);
  final DataDetails data;
  AppController appController = Get.find();

  List<String> listTitle = [
    "",
    "",
    "",
    AppStrings.receiptcustomerSwipe.tr,
    AppStrings.deliverylaundrySwipe.tr,
    "",
    AppStrings.deliverycustomerSwipe.tr,
    AppStrings.deliverycustomerSwipe.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: AppColors.gray,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1))
          ],
          border: Border.all(color: AppColors.gray.withOpacity(.8)),
        ),
        child: Transform.rotate(
            angle: math.pi * 2, // in radians
            child: Directionality(
                textDirection: TextDirection.ltr, // set it to rtl
                child: SliderButton(
                    action: () {
                      log(data.statusId.toString());
                      data.statusId == "3" || data.statusId == "6"
                          ? showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: DeliveryDialog(
                                        onTap: () async {
                                          await ServerOrder.instance
                                              .changeStatus(
                                                  data.id,
                                                  data.statusId! == "6"
                                                      ? (int.parse(data
                                                                  .statusId!) +
                                                              2)
                                                          .toString()
                                                      : (int.parse(data
                                                                  .statusId!) +
                                                              1)
                                                          .toString());

                                          Get.offAll(() => MainScreen());
                                        },
                                        onTap2: () async {
                                          await ServerOrder.instance
                                              .changeStatus(data.id, "11");
                                          Get.offAll(() => MainScreen());
                                        },
                                        StatusId: data.statusId,
                                        title:
                                            AppStrings.confirmationcustomer.tr,
                                        index: 0,
                                        textButton: AppStrings.receive.tr,
                                        totalPrice: data.statusId == "6"
                                            ? data.total.toString() +
                                                AppStrings.currency.tr
                                            : ""));
                              })
                          : showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: DeliveryDialog(
                                        onTap: () async {
                                          await ServerOrder.instance
                                              .changeStatus(
                                                  data.id,
                                                  (int.parse(data.statusId!) +
                                                          1)
                                                      .toString());
                                          appController.selectedPageIndex =
                                              data.statusId == "5" ? 0 : 1;

                                          Get.offAll(() => MainScreen());
                                        },
                                        onTap2: () async {
                                          await ServerOrder.instance
                                              .changeStatus(data.id, "10");

                                          Get.offAll(() => MainScreen());
                                        },
                                        title: AppStrings.deservedamount.tr,
                                        index: 1,
                                        totalPrice: data.total.toString() +
                                            AppStrings.currency.tr));
                              });
                    },
                    label: Text(listTitle[int.parse(data.statusId!)],
                        style: rubikMedium.copyWith(
                            fontSize: 16.sp, color: AppColors.gray)),
                    dismissThresholds: 0.5,
                    dismissible: false,
                    icon: Center(
                        child: Icon(
                      Icons.double_arrow_sharp,
                      color: Colors.white,
                      size: 16.0,
                    )),
                    radius: 10,
                    boxShadow: BoxShadow(blurRadius: 0.0),
                    buttonColor: AppColors.blackDark,
                    backgroundColor: AppColors.white,
                    baseColor: AppColors.primary))));
  }
}
