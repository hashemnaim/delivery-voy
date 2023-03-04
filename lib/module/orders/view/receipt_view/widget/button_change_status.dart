import 'dart:developer';
import 'dart:math' as math;
import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_boy/module/orders/view/receipt_view/widget/to_delivery_dialog.dart';
import 'package:delivery_boy/translations/strings_enum.dart';
import 'package:get/get.dart';
import '../../../../main_screen.dart';
import '../../../controller/controller_order.dart';
import '../../../model/detailsProduct_model.dart';
import '../../../../../utils/export.dart';
import '../../../../../utils/styles.dart';
import '../../../server/server_order.dart';
import 'delivery_dialog.dart';
import 'slider_button.dart';

// ignore: must_be_immutable
class BottunChangeStatus extends StatefulWidget {
  BottunChangeStatus({
    Key? key,
    required this.data,
  }) : super(key: key);
  final DataDetails data;

  @override
  State<BottunChangeStatus> createState() => _BottunChangeStatusState();
}

class _BottunChangeStatusState extends State<BottunChangeStatus> {
  AppController appController = Get.find();

  List<String> listTitle = [
    "",
    "",
    "تحويله الى مندوب للاستلام",
    "تم الاستلام من المندوب",
    "تم الاستلام من المندوب",
    "تحويله الى مندوب للتسليم",
    "استلام المندوب من العميل",
    "",
    "تاكيد عن المندوب باستلام الطلب",
    "",
    AppStrings.deliverycustomerSwipe.tr,
  ];

  OrderController orderController = Get.find();

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
                      log(widget.data.statusId!);
                      if (widget.data.statusId == "4" ||
                          widget.data.statusId == "3") {
                        bottomSlide(widget.data.details![0].catId!);
                      } else {
                        widget.data.statusId == "2" ||
                                widget.data.statusId == "5"
                            ? toSelectDeliveryDialog(context)
                            : normalChangeStatusDialog(context);
                      }
                    },
                    label: Text(listTitle[int.parse(widget.data.statusId!)],
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

  void bottomSlide(String CatId) async {
    if (CatId == "15") {
      if (widget.data.details!
              .indexWhere((element) => element.productOrder!.length == 0) !=
          -1) {
        BotToast.showText(
            text: "يجب اختيار تسعير جميع المنتجات", contentColor: Colors.red);
        return;
      } else {
        await ServerOrder.instance.changeStatus(widget.data.id, "5");
        appController.setPage(1);

        Get.offAll(() => MainScreen());
      }
    } else if (CatId == "13") {
      if (widget.data.details!
              .indexWhere((element) => element.numMeters == "0") !=
          -1) {
        BotToast.showText(
            text: "يجب اختيار تسعير جميع المنتجات", contentColor: Colors.red);
        return;
      } else {
        await ServerOrder.instance.changeStatus(widget.data.id, "5");
        appController.setPage(1);

        Get.offAll(() => MainScreen());
      }
    } else {
      await ServerOrder.instance.changeStatus(widget.data.id, "5");
      appController.setPage(1);

      Get.offAll(() => MainScreen());
    }
  }

  toSelectDeliveryDialog(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: ToSelectDeliveryDialog(
                  onTap: () async {
                    if (orderController.delivaryId.value.id == "0") {
                      BotToast.showText(
                          text: "يجب اختيار مندوب التوصيل",
                          contentColor: Colors.red);

                      return;
                    } else {
                      await ServerOrder.instance.AddDeliveryOrder(
                          widget.data.id,
                          orderController.delivaryId.value.id!,
                          (int.parse(widget.data.statusId!) + 1).toString());

                      Get.offAll(() => MainScreen());
                    }
                  },
                  title: AppStrings.confirmationcustomer.tr,
                  index: 0,
                  textButton: AppStrings.deliveredDone.tr,
                  totalPrice: ""));
        });
  }

  void normalChangeStatusDialog(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: DeliveryDialog(
                  onTap: () async {
                    await ServerOrder.instance.changeStatus(
                        widget.data.id,
                        widget.data.statusId == "6"
                            ? "9"
                            : (int.parse(widget.data.statusId!) + 1)
                                .toString());
                    appController.setPage(1);
                    Get.offAll(() => MainScreen());
                  },
                  onTap2: () async {
                    await ServerOrder.instance
                        .changeStatus(widget.data.id, "11");

                    Get.offAll(() => MainScreen());
                  },
                  title: AppStrings.deservedamount.tr,
                  index: 1,
                  textButton: AppStrings.deservedamount.tr,
                  totalPrice:
                      widget.data.total.toString() + AppStrings.currency.tr));
        });
  }
}
