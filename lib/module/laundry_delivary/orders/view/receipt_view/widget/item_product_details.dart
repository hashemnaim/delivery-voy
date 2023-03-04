import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_boy/translations/strings_enum.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/detailsProduct_model.dart';
import '../../../../../../utils/export.dart';

import '../../../../../../utils/styles.dart';
import '../../../../../Widget/custom_button.dart';
import '../../../controller/controller_order.dart';
import '../../../model/product_order_model.dart';
import '../../../server/server_order.dart';

class ItmeProductDatiles extends StatefulWidget {
  const ItmeProductDatiles(
      {required this.data, required this.index, required this.idOrder});
  final DataDetails data;
  final int index, idOrder;

  @override
  State<ItmeProductDatiles> createState() => _ItmeProductDatilesState();
}

class _ItmeProductDatilesState extends State<ItmeProductDatiles> {
  OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return widget.data.details![widget.index].catId == "15"
        ? item(context, widget.data.details![widget.index], true,
            widget.data.details![widget.index].productOrder!.isEmpty, false)
        : widget.data.details![widget.index].catId == "13"
            ? item(
                context, widget.data.details![widget.index], true, true, true)
            : item(context, widget.data.details![widget.index], false, false,
                true);
  }

  ListTile item(BuildContext context, Details data, bool isNormalProduct,
      bool isProduct, bool isCarpet) {
    return ListTile(
        trailing: isNormalProduct == true
            ? isProduct == false
                ? Container() // CustomButton(
                //     text: AppStrings.details.tr,
                //     height: 40.h,
                //     width: 70.w,
                //     fontText: 12.sp,
                //     colorText: Colors.white,
                //     color: AppColors.primary2,
                //     onTap: () async {
                //       await getBottomSheet(
                //           context, widget.index, data.productOrder!, data);
                //     })
                : data.numMeters == "0"
                    ? Container(
                        height: 40.h,
                        width: 70.w,
                      )
                    //  CustomButton(
                    //     text: AppStrings.add.tr,
                    //     height: 40.h,
                    //     width: 70.w,
                    //     fontText: 12.sp,
                    //     colorText: Colors.white,
                    //     onTap: () async {
                    //       if (isCarpet == true) {
                    //         setState(() {
                    //           bottomCarpet(context, widget.index,
                    //               data.productOrder!, data, widget.idOrder);
                    //         });
                    //       } else {
                    //         Get.to(() =>
                    //             ClothesProductScreen(widget.idOrder, data));
                    //       }
                    //     })

                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                            data.totalProduct.toString() +
                                " " +
                                AppStrings.currency.tr,
                            style: rubikMedium.copyWith(fontSize: 16.sp)))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                    double.parse(data.price!).round().toString() +
                        " " +
                        AppStrings.currency.tr,
                    style: rubikMedium.copyWith(fontSize: 16.sp)),
              ),
        minVerticalPadding: 4.h,
        leading: SizedBox(
            width: 160.w,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data.productName!,
                            style: rubikMedium.copyWith(fontSize: 18.sp)),
                        widget.data.details![widget.index].catId == "13"
                            ? Text(
                                "${double.parse(data.price!).toStringAsFixed(0)} ${AppStrings.permetre.tr}",
                                style: rubikMedium.copyWith(
                                    fontSize: 14.sp, height: 1.4.h))
                            : Text(" " + data.type!,
                                style: rubikMedium.copyWith(
                                    fontSize: 14.sp, height: 1.4.h))
                      ])
                ])),
        title:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${AppStrings.number.tr} " + data.qty!,
              style: rubikMedium.copyWith(
                  fontSize: 16.sp, fontWeight: FontWeight.bold)),
          data.numMeters == "0"
              ? Container()
              : Text(
                  data.numMeters! + " م ",
                )
        ],
      ),
      
        contentPadding: EdgeInsets.zero);
  }

  getBottomSheet(BuildContext context, int indexOrder,
      List<ProductOrder> product, Details details) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        elevation: 0,
        isDismissible: true,
        enableDrag: true,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        builder: (BuildContext context) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                SizedBox(height: 6.h),
                Center(
                    child: Container(
                        height: 5.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white))),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                          text: AppStrings.Separateme.tr,
                          fontSize: 18.sp,
                          textAlign: TextAlign.start,
                          color: Colors.white)),
                  // Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: CustomButton(
                  //         text: " إضافة جديد ",
                  //         height: 40.h,
                  //         width: 80.w,
                  //         fontText: 12.sp,
                  //         color: Colors.white,
                  //         colorText: AppColors.primary,
                  //         onTap: () {
                  //           Get.to(() =>
                  //               ClothesProductScreen(idOrder, details));
                  //         }))
                ]),
                Expanded(
                    child: ListView.builder(
                        itemCount: orderController.detailsProduct.data!
                            .details![indexOrder].productOrder!.length,
                        padding: EdgeInsets.all(4),
                        itemBuilder: (context, index) => FadeInLeft(
                            duration: Duration(milliseconds: index * 200),
                            child: Card(
                                child: ListTile(
                                    title: CustomText(
                                        text: AppStrings.number.tr +
                                            orderController
                                                .detailsProduct
                                                .data!
                                                .details![indexOrder]
                                                .productOrder![index]
                                                .qty
                                                .toString(),
                                        fontSize: 16.sp),
                                    leading: SizedBox(
                                      width: 120.w,
                                      child: CustomText(
                                          text: orderController
                                              .detailsProduct
                                              .data!
                                              .details![indexOrder]
                                              .productOrder![index]
                                              .name,
                                          fontSize: 18.sp),
                                    ),
                                    trailing: CustomText(
                                        text: orderController
                                                .detailsProduct
                                                .data!
                                                .details![indexOrder]
                                                .productOrder![index]
                                                .total_product
                                                .toString() +
                                            " " +
                                            AppStrings.currency.tr,
                                        fontSize: 16.sp,
                                        textAlign: TextAlign.center)))))),
                Center(
                    child: CustomText(
                        text: " ${AppStrings.total.tr} : " +
                            orderController.detailsProduct.data!
                                .details![indexOrder].totalProduct
                                .toString() +
                            " " +
                            AppStrings.currency.tr,
                        fontSize: 20,
                        color: Colors.white)),
                SizedBox(height: 8)
              ]));
        });
  }

  ////////////////////////
  bottomCarpet(BuildContext context, int indexOrder, List<ProductOrder> product,
      Details details, int idOrder) {
    List<TextEditingController> list = [];
    List<double> numMater = [];
    orderController.lood.value = 0;

    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 350.h,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 6.h),
                  Center(
                    child: Container(
                        height: 5.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: "${AppStrings.carpets.tr} ",
                          fontSize: 20.sp,
                          textAlign: TextAlign.start,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: int.parse(details.qty!),
                        padding: EdgeInsets.all(4),
                        itemBuilder: (context, index) {
                          list.insert(index, TextEditingController(text: ""));
                          numMater.insert(index, 0);

                          return FadeInLeft(
                              duration: Duration(milliseconds: index * 500),
                              child: Card(
                                child: ListTile(
                                    contentPadding: EdgeInsets.all(3),
                                    title: CustomText(
                                      text: double.parse(details.price!)
                                              .round()
                                              .toString() +
                                          " " +
                                          AppStrings.currency.tr,
                                      textAlign: TextAlign.center,
                                    ),
                                    leading: CustomText(
                                        text:
                                            "${AppStrings.carpetno.tr} ${index + 1}",
                                        fontSize: 18.sp),
                                    trailing: Container(
                                        width: 115.w,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                    height: 60.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      color: const Color(
                                                          0xFFE9E9E9),
                                                    ),
                                                    child: TextFormField(
                                                        onChanged: (value) {
                                                          list[index].text =
                                                              value;
                                                          if (value != "") {
                                                            numMater[index] =
                                                                double.parse(
                                                                    value);
                                                          } else {
                                                            numMater[index] =
                                                                0.0;
                                                          }
                                                        },
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets.all(6),
                                                          hintText:
                                                              list[index].text,
                                                          hintStyle:
                                                              GoogleFonts.cairo(
                                                            color: Colors
                                                                .grey[500],
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          fillColor:
                                                              const Color(
                                                                  0xFFE9E9E9),
                                                          filled: true,
                                                          border:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                            color: AppColors
                                                                .blackLight,
                                                            width: 2.w,
                                                          )),
                                                        ))),
                                              ),
                                              CustomText(
                                                  text: "  2${AppStrings.m.tr}",
                                                  fontSize: 18.sp),
                                            ],
                                          ),
                                        ))),
                              ));
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: AppStrings.add.tr,
                      height: 50.h,
                      width: 200.w,
                      fontText: 16.sp,
                      color: Colors.white,
                      colorText: AppColors.primary,
                      onTap: () async {
                        double numMaterTotal = numMater
                            .reduce((value, element) => value + element);

                        var stringList = numMater
                            .where((element) => element != 0.0)
                            .toList()
                            .join(",");

                        if (numMater
                                .where((element) => element != 0.0)
                                .toList()
                                .length !=
                            int.parse(details.qty!)) {
                          BotToast.showText(
                              text: AppStrings.productsAdd.tr,
                              contentColor: Colors.red);
                        } else {
                          await ServerOrder.instance.getUpdateOrderItems(
                              details.id!,
                              stringList,
                              numMaterTotal.toString());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
