import 'package:delivery_boy/module/laundry_delivary/orders/model/order_modal.dart';
import 'package:delivery_boy/helper/luncher_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../helper/date_converter.dart';
import '../../../../../../translations/strings_enum.dart';
import '../../../../../../utils/export.dart';
import '../../../../../Widget/lunchers_helper.dart';
import '../screen/order_details_screen.dart';

class DelivaryOrderWidget extends StatelessWidget {
  final List<Data>? orderModel;
  final int index;
  DelivaryOrderWidget({this.orderModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.gray.withOpacity(.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1))
          ],
          color: AppColors.gray.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(
                  Icons.person,
                  color: AppColors.primary,
                ),
                SizedBox(width: 8),
                CustomText(
                    text: '${orderModel![index].customer!.name ?? ''}',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600)
              ]),
              CustomText(
                text: '#${orderModel![index].code.toString()}',
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on, color: AppColors.primary),
              SizedBox(width: 8.w),
              Expanded(
                  child: CustomText(
                text: orderModel![index].address != null
                    ? orderModel![index].address!.address!
                    : AppStrings.noAddress.tr,
              )),
            ],
          ),
          SizedBox(height: 8.w),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Row(children: [
                  Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.primary)),
                  SizedBox(width: 8),
                  CustomText(
                    text: AppStrings.date.tr +
                        ' : ${orderModel![index].deliveryDate}',
                    fontSize: 14.sp,
                  ),
                ]),
                Spacer(),
                Row(children: [
                  Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.primary)),
                  SizedBox(width: 8.w),
                  CustomText(
                    text: AppStrings.period.tr +
                        ' : ${DateConverter.getPeriod(orderModel![index].deliveryTime!)}',
                    fontSize: 14.sp,
                  ),
                ]),
                SizedBox(width: 8.w),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50.h,
                width: 70.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: AppColors.white),
                child: IconButton(
                    icon: Icon(Icons.phone, color: AppColors.primary),
                    onPressed: () {
                      // ignore: deprecated_member_use
                      launch('tel:${orderModel![index].customer!.phone ?? ""}');
                    }),
              ),
              Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: AppColors.white),
                child: IconButton(
                    icon: Icon(Icons.whatsapp, color: AppColors.primary),
                    onPressed: () {
                      LuncherHelper.validationHelper.launchWhatsApp(
                          phone: orderModel![index].customer!.phone!,
                          message: "");
                    }),
              ),
              Container(
                height: 50.h,
                width: 70.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: AppColors.white),
                child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: AppColors.primary,
                    ),
                    onPressed: () async {
                      Get.to(() => OrderDetailsRecpitScreen(
                            id: orderModel![index].id!,
                          ));
                    }),
              ),
              Container(
                  height: 50.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: AppColors.white),
                  child: IconButton(
                      icon: Icon(Icons.location_on, color: AppColors.primary),
                      onPressed: () async {
                        var position = await Geolocator.getCurrentPosition();
                        MapUtils.openMap(
                            double.parse(orderModel![index].address!.lat!),
                            double.parse(orderModel![index].address!.lng!),
                            position.latitude,
                            position.longitude);
                      }))
            ],
          ),
        ],
      ),
    );
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(
      double destinationLatitude,
      double destinationLongitude,
      double userLatitude,
      double userLongitude) async {
    String googleUrl =
        'https://www.google.com/maps/dir/?api=1&origin=$userLatitude,$userLongitude'
        '&destination=$destinationLatitude,$destinationLongitude&mode=d';
    Launcher.launcher.launchURL(googleUrl);
    // if (await canLaunch(googleUrl)) {
    //   await launch(googleUrl);
    // } else {
    //   throw 'Could not open the map.';
    // }
  }
}
