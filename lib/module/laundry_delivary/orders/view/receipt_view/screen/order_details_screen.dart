import 'package:delivery_boy/module/laundry_delivary/orders/controller/controller_order.dart';
import 'package:delivery_boy/module/laundry_delivary/orders/server/server_order.dart';
import 'package:delivery_boy/translations/strings_enum.dart';
import '../../../../../../utils/export.dart';
import 'package:get/get.dart';
import '../../../../../print/controller_print.dart';
import '../../../model/detailsProduct_model.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../Widget/custom_divider.dart';
import '../../../../../Widget/custom_loading.dart';
import '../widget/button_change_status.dart';
import '../widget/customer_info.dart';
import '../widget/date_time_order.dart';
import '../widget/header_details_order.dart';
import '../widget/item_product_details.dart';

// ignore: must_be_immutable
class OrderDetailsRecpitScreen extends GetView<OrderController> {
  final int id;
  PrintController printController = Get.find();
    OrderDetailsRecpitScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetailsOrderModel>(
        future: ServerOrder.instance.getOrderDetails(id),
        builder:
            (BuildContext context, AsyncSnapshot<DetailsOrderModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Material(child: CustomLoading());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Container();
              } else {
                return Scaffold(
                    appBar: AppBar(
                        backgroundColor: Theme.of(context).cardColor,
                        actions: [
                          IconButton(
                            icon: Icon(Icons.print,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color),
                            onPressed: () async {
                              await printController
                                  .printSunmi(snapshot.data!.data!);
                              // await printController.printSunmiTest();
                              // printController
                              //     .invoiceBuilder(snapshot.data!.data!);
                            },
                          )
                        ],
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        title: CustomText(
                          text: AppStrings.orderdetails.tr,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        centerTitle: true),
                    body: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: ListView(
                                      padding: EdgeInsets.zero,
                                      children: [
                                    CustomerInfo(data: snapshot.data!.data!),
                                    DateTimeOrder(data: snapshot.data!.data!),
                                    SizedBox(height: 8.h),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              AppStrings.numberproducts.tr +
                                                  ' : ${snapshot.data!.data!.details!.length}',
                                              style: rubikMedium),
                                          Text(
                                              AppStrings.paymentmethod.tr +
                                                  ' : ${snapshot.data!.data!.payment ?? AppStrings.noPayment.tr}',
                                              style: rubikMedium)
                                        ]),
                                    Divider(height: 8.h),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        itemCount: snapshot
                                            .data!.data!.details!.length,
                                        itemBuilder: (context, index2) {
                                          return ItmeProductDatiles(
                                              data: snapshot.data!.data!,
                                              index: index2,
                                              idOrder: id);
                                        }),
                                    SizedBox(height: 8.h),
                                    CustomDivider(),
                                    SizedBox(height: 8.h),
                                    HeaderDetailsOrder(
                                        data: snapshot.data!.data!)
                                  ])),
                              int.parse(snapshot.data!.data!.statusId!) == 4
                                  ? Container()
                                  : int.parse(snapshot.data!.data!.statusId!) <=
                                          6
                                      ? BottunChangeStatus(
                                          data: snapshot.data!.data!)
                                      : Container()
                            ])));
              }
            default:
              return Container();
          }
        });
  }
}
