import 'package:delivery_boy/module/Widget/custom_loading.dart';
import 'package:delivery_boy/module/laundry_delivary/orders/controller/controller_order.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../helper/date_converter.dart';
import '../../../../translations/strings_enum.dart';
import '../../../../utils/export.dart';
import '../../../../utils/styles.dart';
import '../server/server_order.dart';
import 'receipt_view/screen/order_details_screen.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  OrderController orderController = Get.find();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  DateTime selectedDate = DateTime.now();
  double width = 80.w;
  double higth = 40.h;
  DateTime newDate = DateTime.now();
  String formatted = DateTime.now().toString();
  int indexDate = 0;
  int load = 0;
  @override
  void initState() {
    super.initState();
    final DateFormat format = DateFormat('dd-MM-yyyy');
    formatted = format.format(newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          setState(() {
                            indexDate = 2;
                          });
                          newDate = await showDatePicker(
                                firstDate: DateTime.utc(2000, 11, 9),
                                initialDate: newDate,
                                cancelText: "Cancel".tr,
                                confirmText: "Ok".tr,
                                helpText: "Select Time".tr,
                                locale: Locale("en", "ar"),
                                context: context,
                                lastDate: DateTime.now(),
                              ) ??
                              DateTime.now();
                          setState(() {
                            load = 1;
                          });

                          await ServerOrder.instance
                              .getOrders(date: newDate.toString());
                          setState(() {
                            final DateFormat format = DateFormat('dd-MM-yyyy');
                            formatted = format.format(newDate);
                            load = 0;
                          });
                        },
                        child: Container(
                          height: 40.h,
                          width: 120.h,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                text: formatted.substring(0, 10),
                                color: indexDate == 2
                                    ? AppColors.white
                                    : AppColors.blackLight,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: indexDate == 2
                                  ? AppColors.primary
                                  : AppColors.gray,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            indexDate = 1;
                            load = 1;
                          });

                          await ServerOrder.instance.getOrders(
                              date: (DateTime.now()
                                      .subtract(const Duration(days: 1)))
                                  .toString());
                          setState(() {
                            load = 0;
                          });
                        },
                        child: Container(
                            height: 35,
                            width: 84,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: CustomText(
                                text: AppStrings.yesterday.tr,
                                color: indexDate == 1
                                    ? AppColors.white
                                    : AppColors.blackLight,
                                fontSize: 17,
                              ),
                            )),
                            decoration: BoxDecoration(
                                color: indexDate == 1
                                    ? AppColors.primary
                                    : AppColors.gray,
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(width: 15.w),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            indexDate = 0;
                            load = 1;
                          });

                          await ServerOrder.instance.getOrders();
                          setState(() {
                            load = 0;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 80,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Center(
                              child: CustomText(
                                text: AppStrings.Today.tr,
                                color: indexDate == 0
                                    ? AppColors.white
                                    : AppColors.blackLight,
                                fontSize: 18,
                              ),
                            ),
                          )),
                          decoration: BoxDecoration(
                              color: indexDate == 0
                                  ? AppColors.primary
                                  : AppColors.gray,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
                if (load == 1)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: CustomLoading(height: 100, width: 100)),
                      ],
                    ),
                  )
                else
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                            child: orderController.finshOrderModel.isNotEmpty
                                ? RefreshIndicator(
                                    key: _refreshIndicatorKey,
                                    onRefresh: () {
                                      return ServerOrder.instance.getOrders();
                                    },
                                    child: Obx(() => ListView.builder(
                                        itemCount: orderController
                                            .finshOrderModel.length,
                                        padding: EdgeInsets.all(12),
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      OrderDetailsRecpitScreen(
                                                          id: orderController
                                                              .finshOrderModel[
                                                                  index]
                                                              .id!));
                                                },
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 6),
                                                    margin: EdgeInsets.only(
                                                        bottom: 12),
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: AppColors
                                                                  .gray
                                                                  .withOpacity(
                                                                      .5),
                                                              spreadRadius: 1,
                                                              blurRadius: 1,
                                                              offset:
                                                                  Offset(0, 1))
                                                        ],
                                                        color: AppColors.gray
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(children: [
                                                            Expanded(
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                  Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            '# ${orderController.finshOrderModel[index].code}',
                                                                            style:
                                                                                rubikMedium.copyWith(fontSize: 20.sp, color: AppColors.bluColor),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                            orderController.finshOrderModel[index].total.toString() +
                                                                                " " +
                                                                                AppStrings.currency.tr,
                                                                            style: rubikRegular.copyWith(fontSize: 20, color: AppColors.primary))
                                                                      ]),
                                                                  SizedBox(
                                                                      height:
                                                                          16),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8),
                                                                    child: Row(
                                                                      children: [
                                                                        Row(
                                                                            children: [
                                                                              Container(height: 10.h, width: 10.w, decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primary)),
                                                                              SizedBox(width: 8),
                                                                              CustomText(
                                                                                text: AppStrings.date.tr + ' : ${orderController.finshOrderModel[index].receiptDate}',
                                                                                fontSize: 14.sp,
                                                                              ),
                                                                            ]),
                                                                        Spacer(),
                                                                        Row(
                                                                            children: [
                                                                              Container(height: 10.h, width: 10.w, decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primary)),
                                                                              SizedBox(width: 8.w),
                                                                              CustomText(
                                                                                text: AppStrings.period.tr + ' : ${DateConverter.getPeriod(orderController.finshOrderModel[index].receiptTime!)}',
                                                                                fontSize: 14.sp,
                                                                              ),
                                                                            ]),
                                                                        SizedBox(
                                                                            width:
                                                                                8.w),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ]))
                                                          ])
                                                        ]))))))
                                : Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                        CustomSvgImage(
                                            imageName: "order_empty",
                                            height: 300.h,
                                            width: 300.w),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: CustomText(
                                                text: AppStrings.noRequests.tr,
                                                color: AppColors.blackDark,
                                                fontSize: 30))
                                      ]))),
                        orderController.finshOrderModel.isEmpty
                            ? Container()
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomText(
                                            text: AppStrings.total.tr,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                        if (orderController
                                            .finshOrderModel.isEmpty)
                                          CustomText(text: "0", fontSize: 24.sp)
                                        else
                                          CustomText(
                                              text: orderController
                                                  .finshOrderModel
                                                  .map(
                                                      (e) => e.total.toString())
                                                  .toList()
                                                  .reduce((value, element) =>
                                                      ((double.parse(value) +
                                                              double.parse(
                                                                  element))
                                                          .toStringAsFixed(0))),
                                              color: AppColors.blackLight,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.sp)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomText(
                                            text: AppStrings.products.tr,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                        if (orderController.finshOrderModel.isEmpty)
                                          CustomText(text: "0", fontSize: 24.sp)
                                        else
                                          CustomText(
                                              text: (double.parse(orderController.finshOrderModel
                                                          .map((e) => e.total
                                                              .toString())
                                                          .toList()
                                                          .reduce((value, element) =>
                                                              ((double.parse(value) + double.parse(element)))
                                                                  .toString())) -
                                                      double.parse(orderController
                                                          .finshOrderModel
                                                          .map((e) => e.deliveryPrice.toString())
                                                          .toList()
                                                          .reduce((value, element) => ((double.parse(value) + double.parse(element))).toString())
                                                          .toString()))
                                                  .toStringAsFixed(0),
                                              color: AppColors.blackLight,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.sp)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomText(
                                            text: AppStrings.delivery.tr,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                        orderController.finshOrderModel.isEmpty
                                            ? CustomText(
                                                text: "0", fontSize: 24.sp)
                                            : CustomText(
                                                text: orderController
                                                    .finshOrderModel
                                                    .map((e) => e.deliveryPrice
                                                        .toString())
                                                    .toList()
                                                    .reduce((value, element) =>
                                                        ((double.parse(value) +
                                                                double.parse(
                                                                    element))
                                                            .toStringAsFixed(
                                                                0))),
                                                color: AppColors.blackLight,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.sp)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomText(
                                            text: AppStrings.noOrder.tr,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                        orderController.finshOrderModel.isEmpty
                                            ? CustomText(
                                                text: "0", fontSize: 24.sp)
                                            : CustomText(
                                                text: orderController
                                                    .finshOrderModel.length
                                                    .toString(),
                                                color: AppColors.blackLight,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.sp)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  )
              ],
            )));
  }
}
