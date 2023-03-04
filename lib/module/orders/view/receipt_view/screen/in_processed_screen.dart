import 'package:delivery_boy/module/Widget/custom_button.dart';
import 'package:delivery_boy/module/orders/controller/controller_order.dart';
import 'package:delivery_boy/translations/strings_enum.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../model/detailsProduct_model.dart';
import '../../../../../utils/export.dart';
import '../../../../Widget/custom_erorr.dart';
import '../../../../Widget/custom_loading.dart';
import '../../../controller/product_controller.dart';
import '../../../model/list_product_model.dart';
import '../../../model/product_model.dart';
import '../../../server/server_order.dart';
import '../widget/item_product.dart';
import '../../../order_details_screen.dart';

// ignore: must_be_immutable
class ClothesProductScreen extends GetWidget<ProductController> {
  final int orderId;
  final Details details;
  ClothesProductScreen(this.orderId, this.details);
  OrderController orderController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 4,
        animationDuration: Duration(milliseconds: 500),
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).cardColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    color: Theme.of(context).textTheme.bodyText1!.color),
                onPressed: () {
                  Get.back();
                },
              ),
              title: CustomText(
                  text: AppStrings.clothesAdd.tr,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              centerTitle: true),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              GetBuilder<ProductController>(
                id: "details",
                builder: (_) {
                  if (_.productListAdd.isEmpty) {
                    return Container();
                  } else {
                    return SizedBox(
                      height: 64.h,
                      child: ListView.builder(
                        itemCount: _.productListAdd.length,
                        padding: EdgeInsets.only(right: 4.w),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ItemProduct(
                          product: _.productListAdd[index],
                          productController: _,
                        ),
                      ),
                    );
                  }
                },
              ),
              Expanded(child: fatchApi())
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              fatchApi2(),
              SizedBox(height: 6.h),
              GetBuilder<ProductController>(
                id: "details",
                builder: (_) {
                  if (_.productListAdd.isEmpty)
                    return Container();
                  else
                    return CustomButton(
                        text: AppStrings.confirmProducts.tr,
                        width: 200,
                        height: 45,
                        colorText: Colors.white,
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    scrollable: true,
                                    contentPadding: EdgeInsets.zero,
                                    titlePadding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 4),
                                    title: CustomText(
                                        text: AppStrings.products.tr),
                                    content: Column(children: [
                                      Container(
                                        height: 350.h,
                                        width: 400.w,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            primary: false,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 4),
                                            itemCount: _.productListAdd.length,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3),
                                                  child: Container(
                                                      height: 60.h,
                                                      child: Card(
                                                          color:
                                                              AppColors.primary,
                                                          elevation: 1,
                                                          child: ListTile(
                                                              leading: CustomText(
                                                                  text: _
                                                                      .productListAdd[
                                                                          index]
                                                                      .name!,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18),
                                                              trailing: CustomText(
                                                                  text: _
                                                                      .productListAdd[
                                                                          index]
                                                                      .qty
                                                                      .toString(),
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      18)))),
                                                )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomButton(
                                            text: AppStrings.confirmation.tr,
                                            width: 200,
                                            height: 45,
                                            colorText: Colors.white,
                                            onTap: () async {
                                              await ServerOrder.instance
                                                  .getAddOrderItems(orderId,
                                                      _.productListAdd);
                                              Get.off(() =>
                                                  OrderDetailsRecpitScreen(
                                                    id: orderId,
                                                  ));
                                            }),
                                      )
                                    ]),
                                  ));
                        },
                        fontText: 16);
                },
              )
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }

  Widget fatchApi() {
    return FutureBuilder<List<List<Product>>>(
        future: controller.getProductWithSubCategory(24),
        builder: (BuildContext context,
            AsyncSnapshot<List<List<Product>>> snapshot) {
          Widget widget;
          if (snapshot.hasData) {
            widget = successWidget(snapshot.data!, context);
          } else if (snapshot.hasError) {
            widget = CustomErorr(text: '${snapshot.error}');
          } else {
            widget = CustomLoading();
          }
          return widget;
        });
  }

  Widget successWidget(List<List<Product>> data, context) {
    return Column(children: [
      Expanded(
          child: TabBarView(
              children: data
                  .map((e) => FadeInRight(
                        duration: Duration(milliseconds: 200),
                        child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 120.h, top: 2),
                            itemCount: e.length,
                            itemBuilder: (context, index) {
                              return GetBuilder<ProductController>(
                                id: "details",
                                builder: (_) {
                                  return Card(
                                    child: ListTile(
                                        title: CustomText(
                                            text: e[index].name ?? ""),
                                        trailing: Container(
                                            width: 150.w,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  CustomText(
                                                    text: e[index].services!.firstWhere(
                                                                (element) =>
                                                                    element
                                                                        .name ==
                                                                    details
                                                                        .type) ==
                                                            -1
                                                        ? ""
                                                        : e[index]
                                                                .services!
                                                                .firstWhere(
                                                                    (element) =>
                                                                        element
                                                                            .name ==
                                                                        details
                                                                            .type)
                                                                .price
                                                                .toString() +
                                                            " " +
                                                            AppStrings
                                                                .currency.tr,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  _.productListAdd.isEmpty
                                                      ? CustomButton(
                                                          text:
                                                              AppStrings.add.tr,
                                                          width: 70.w,
                                                          height: 40,
                                                          colorText:
                                                              Colors.white,
                                                          onTap: () {
                                                            controller
                                                                .AddProduct(
                                                              Product(
                                                                  price_type_id: e[
                                                                          index]
                                                                      .services!
                                                                      .firstWhere((element) =>
                                                                          element.name ==
                                                                          details
                                                                              .type)
                                                                      .id,
                                                                  id:
                                                                      e[index]
                                                                          .id,
                                                                  qty: 1,
                                                                  name: e[index]
                                                                      .name,
                                                                  category: e[
                                                                          index]
                                                                      .category,
                                                                  parentId:
                                                                      details
                                                                          .id),
                                                            );
                                                          },
                                                          fontText: 12)
                                                      : _.productListAdd.indexWhere(
                                                                  (element) =>
                                                                      element
                                                                          .id ==
                                                                      e[index]
                                                                          .id) ==
                                                              -1
                                                          ? CustomButton(
                                                              text: AppStrings
                                                                  .add.tr,
                                                              width: 70.w,
                                                              height: 40,
                                                              colorText:
                                                                  Colors.white,
                                                              onTap: () {
                                                                controller
                                                                    .AddProduct(
                                                                  Product(
                                                                      price_type_id: e[index]
                                                                          .services!
                                                                          .firstWhere((element) =>
                                                                              element.name ==
                                                                              details
                                                                                  .type)
                                                                          .id,
                                                                      id: e[index]
                                                                          .id,
                                                                      qty: 1,
                                                                      name: e[index]
                                                                          .name,
                                                                      category:
                                                                          e[index]
                                                                              .category,
                                                                      parentId:
                                                                          details
                                                                              .id),
                                                                );
                                                              },
                                                              fontText: 12)
                                                          : addQuantity(
                                                              context,
                                                              e[index],
                                                              details
                                                                  .servicePriceId!)
                                                ]))),
                                  );
                                },
                              );
                            }),
                      ))
                  .toList())),
    ]);
  }

  Widget fatchApi2() {
    return FutureBuilder<ListProductModel>(
        future: Future.delayed(
            Duration(milliseconds: 400), () => controller.getSubCategory(24)),
        builder:
            (BuildContext context, AsyncSnapshot<ListProductModel> snapshot) {
          Widget widget;
          if (snapshot.hasData) {
            widget = successWidget2(snapshot.data!.data!, context);
          } else if (snapshot.hasError) {
            widget = CustomErorr(text: '${snapshot.error}');
          } else {
            widget = SizedBox.shrink();
          }
          return widget;
        });
  }

  Widget successWidget2(List<Product> data, context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(23),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1))
              ]),
          child: TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 8.w),
              labelStyle: GoogleFonts.cairo(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.white,
              ),
              automaticIndicatorColorAdjustment: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
              padding: const EdgeInsets.all(4.0),
              tabs: data.map((e) => Tab(text: e.name!)).toList(),
              physics: BouncingScrollPhysics(),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: GoogleFonts.cairo(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.bluColor),
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20.r),
              )),
        ));
  }

  Widget addQuantity(
      BuildContext context, Product dataService, int servicePriceId) {
    return Container(
        height: 80.h,
        width: 84.w,
        child: GetBuilder<ProductController>(
            id: "details",
            builder: (_) {
              int index = _.productListAdd.indexWhere(
                (element) => element.id == dataService.id,
              );
              return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () async {
                          int index = _.productListAdd.indexWhere(
                              (element) => element.id == dataService.id);
                          if (_.productListAdd[index].qty! <= 1) {
                            _.removeProduct(index);
                          } else {
                            _.updateProduct(
                                index, _.productListAdd[index].qty! - 1);
                          }
                        },
                        child: Container(
                            height: 28.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primary),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.remove,
                                color: AppColors.blackDark, size: 20))),
                    SizedBox(width: 6.w),
                    Text(
                        _.productListAdd.indexWhere((element) =>
                                    element.id == dataService.id) ==
                                -1
                            ? "0"
                            : (_.productListAdd[index].qty).toString(),
                        style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(width: 6.w),
                    GestureDetector(
                        onTap: () async {
                          _.updateProduct(
                              index, _.productListAdd[index].qty! + 1);
                        },
                        child: Container(
                            height: 28.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.primary),
                                shape: BoxShape.circle),
                            child: Icon(Icons.add,
                                color: AppColors.blackDark, size: 20))),
                  ]);
            }));
  }
}
