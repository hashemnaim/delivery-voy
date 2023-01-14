// import 'package:date_time_picker/date_time_picker.dart' as piker;
import 'package:delivery_boy/utils/export.dart';
import 'package:intl/intl.dart' as i;
import '../laundry_delivary/orders/model/detailsProduct_model.dart';
import '../Widget/custom_divider.dart';

import '../../utils/styles.dart';

class FatoraScreen extends StatelessWidget {
  final DetailsOrderModel? order;

  FatoraScreen({this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                      width: 180, height: 50, child: CustomPngImage("im3"))),
              CustomText(
                text: "***************************************",
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "رقم الفاتورة : ${order!.data!.code}",
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "اسم المستخدم : هاشم",
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "التاريخ : ${order!.data!.deliveryDate}",
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "الوقت : ${order!.data!.deliveryTime}",
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "***************************************",
                fontWeight: FontWeight.bold,
              ),
              Row(children: [
                CustomText(
                  text: "Time : " +
                      i.DateFormat('kk:mm').format(DateTime.now()).toString(),
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                CustomText(
                  text: "Date : " +
                      i.DateFormat('EEE, M/d/y')
                          .format(DateTime.now())
                          .toString(),
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: "كاش",
                  fontWeight: FontWeight.bold,
                ),
              ]),
              SizedBox(height: 2),
              Divider(),
              if (order!.data!.details!.length == 0)
                Container()
              else
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  itemCount: order!.data!.details!.length,
                  itemBuilder: (context, index2) {
                    return ListTile(
                      trailing: Text(
                          order!.data!.details![index2].price.toString() +
                              " ريال",
                          style: rubikMedium.copyWith(fontSize: 14.sp)),
                      leading: SizedBox(
                        width: 140.w,
                        child: Row(
                          children: [
                            SizedBox(width: 4.w),
                            Container(
                              width: 90.w,
                              child: Text(
                                  order!.data!.details![index2].productName!,
                                  style: rubikMedium.copyWith(fontSize: 14.sp)),
                            ),
                          ],
                        ),
                      ),
                      title: Text(
                        " ${order!.data!.details![index2].qty} X",
                        style: rubikMedium.copyWith(
                          fontSize: 8,
                        ),
                      ),
                    );
                  },
                ),
              SizedBox(height: 8.h),
              // CustomDivider(),
              SizedBox(height: 8.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('مجموع المنتجات',
                    style: rubikMedium.copyWith(
                      fontSize: 8,
                    )),
                Text(order!.data!.total!.toString() + " جنيه",
                    style: rubikMedium.copyWith(
                      fontSize: 8,
                    )),
              ]),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CustomText(
                  text: 'رسوم التوصيل',
                  fontSize: 8,
                ),
                CustomText(
                  text: '${order!.data!.delivery!.toString()} ريال',
                  fontSize: 8,
                ),
              ]),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: CustomDivider(),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CustomText(
                  text: 'المبلغ الاجمالي',
                  fontSize: 20,
                ),
                CustomText(
                  text: (double.parse(order!.data!.total.toString()) +
                              double.parse(order!.data!.delivery!))
                          .toString() +
                      " ريال",
                  fontSize: 20,
                ),
              ]),
              SizedBox(height: 8.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: CustomText(
                      text: "اي استفسار التواصل على رقم ",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  CustomText(
                    text: "ORIGINAL COPY",
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  CustomText(
                    text: "نسخة اصليه",
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
