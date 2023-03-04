import 'package:delivery_boy/translations/strings_enum.dart';
import 'package:get/get.dart';
import '../../../model/detailsProduct_model.dart';
import '../../../../../utils/export.dart';
import '../../../../../utils/styles.dart';
import '../../../../Widget/custom_divider.dart';

class HeaderDetailsOrder extends StatelessWidget {
  const HeaderDetailsOrder({required this.data});

  final DataDetails data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(AppStrings.total.tr,
                    style: rubikMedium.copyWith(
                      fontSize: 16.sp,
                    )),
                data.total! == data.deliveryPrice
                    ? Text(AppStrings.productsAdd.tr,
                        style: rubikMedium.copyWith(
                          fontSize: 16.sp,
                        ))
                    : Text(
                        data.subTotal!.toStringAsFixed(0) +
                            " " +
                            AppStrings.currency.tr,
                        style: rubikMedium.copyWith(fontSize: 16.sp))
              ]),
              SizedBox(height: 10.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CustomText(text: AppStrings.DeliveryCharge.tr, fontSize: 16.sp),
                SizedBox(height: 8.h),
                CustomText(
                    text:
                        '${data.deliveryPrice!.toStringAsFixed(0)} ${AppStrings.currency.tr}',
                    fontSize: 16.sp),
              ]),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: CustomDivider(),
              ),
              SizedBox(height: 8.h),
              totalPrice(),
              SizedBox(height: 8.h)
            ],
          ),
          // data.statusId == "2"
          //     ? isAdd() == true
          //         ? BottunChangeStatus(data: data)
          //         : SizedBox.shrink()
          //     : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget totalPrice() {
    if (isAdd() == false) {
      return Center(child: CustomText(text: "", fontSize: 20));
    } else {
      if (isCarpte() == false) {
        return Center(child: CustomText(text: "", fontSize: 20));
      } else {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: AppStrings.totalamount.tr, fontSize: 20.sp),
              CustomText(
                  text: data.total!.toString() + " " + AppStrings.currency.tr,
                  fontSize: 20.sp),
            ]);
      }
    }
  }

  bool isAdd() {
    int index = data.details!.indexWhere((element) => element.catId == "15");
    if (index == -1) {
      return true;
    } else {
      List list =
          data.details!.where((element) => element.totalProduct == 0).toList();

      if (list.isEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  bool isCarpte() {
    int index = data.details!.indexWhere((element) => element.catId == "13");
    if (index == -1) {
      return true;
    } else {
      List list =
          data.details!.where((element) => element.numMeters == "0").toList();

      if (list.isEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }
}
