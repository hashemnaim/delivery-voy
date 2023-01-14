import 'package:delivery_boy/translations/strings_enum.dart';
import 'package:get/get.dart';

import '../../../../../../helper/date_converter.dart';
import '../../../model/detailsProduct_model.dart';
import '../../../../../../utils/export.dart';

class DateTimeOrder extends StatelessWidget {
  const DateTimeOrder({super.key, this.data});
  final DataDetails? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          int.parse(data!.statusId!) <= 3
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: AppStrings.receive.tr,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                    dateTime(data!.receiptDate!, data!.receiptTime!, context),
                    SizedBox(height: 6.h),
                  ],
                )
              : Container(),
          int.parse(data!.statusId!) > 3
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: AppStrings.delivery.tr,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                    dateTime(data!.deliveryDate!, data!.deliveryTime!, context),
                    SizedBox(height: 6.h)
                  ],
                )
              : Container(),
        ]));
  }

  Row dateTime(String date, String time, BuildContext context) {
    return Row(
      children: [
        Row(children: [
          Container(
              height: 10.h,
              width: 10.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primary)),
          SizedBox(width: 4),
          CustomText(
              text: '${AppStrings.date.tr} : ${date}',
              fontSize: 16.sp,
              color: Theme.of(context).textTheme.bodyText1!.color)
        ]),
        Spacer(),
        time == ""
            ? Container()
            : Row(children: [
                Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primary)),
                SizedBox(width: 4),
                CustomText(
                    text:
                        '${AppStrings.period.tr} : ${DateConverter.getPeriod(time)}',
                    fontSize: 16.sp,
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ]),
        SizedBox(width: 4.w),
      ],
    );
  }
}
