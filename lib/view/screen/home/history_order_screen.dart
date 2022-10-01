import 'package:delivery_boy/controller/controller_order.dart';

import 'package:delivery_boy/values/dimensions.dart';
import 'package:delivery_boy/values/export.dart';
import 'package:delivery_boy/values/styles.dart';
import 'package:get/get.dart';

import '../../../server/server_order.dart';
import '../order/order_details_screen.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  OrderController orderController = Get.find();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage("assets/images/background.png"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: orderController.finshOrderModel.value.orderId!.isNotEmpty
                  ? RefreshIndicator(
                      key: _refreshIndicatorKey,
                      onRefresh: () {
                        return ServerOrder.instance.getOrders();
                      },
                      child: Obx(
                        () => ListView.builder(
                            itemCount: orderController
                                .finshOrderModel.value.orderId!.length,
                            padding:
                                EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () async {
                                    await ServerOrder.instance.getOrderId(
                                      orderController.finshOrderModel.value
                                          .orderId![index].id!,
                                    );
                                    Get.to(() => OrderDetailsScreen(
                                          index: index,
                                          user: orderController.finshOrderModel
                                              .value.orderId![index].user!,
                                        ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        Dimensions.PADDING_SIZE_SMALL),
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.PADDING_SIZE_SMALL),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Theme.of(context)
                                                .shadowColor
                                                .withOpacity(.5),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0, 1))
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            SizedBox(
                                                width: Dimensions
                                                    .PADDING_SIZE_SMALL),
                                            Expanded(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            '# ${orderController.finshOrderModel.value.orderId![index].id}',
                                                            style: rubikMedium.copyWith(
                                                                fontSize: Dimensions
                                                                    .FONT_SIZE_EXTRA_LARGE,
                                                                color: AppColors
                                                                    .bluColor),
                                                          ),
                                                        ),
                                                        Text(
                                                            orderController
                                                                    .finshOrderModel
                                                                    .value
                                                                    .orderId![
                                                                        index]
                                                                    .totalPrice
                                                                    .toString() +
                                                                " جنيه",
                                                            style: rubikRegular
                                                                .copyWith(
                                                                    fontSize:
                                                                        20,
                                                                    color: AppColors
                                                                        .primary)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                        height: Dimensions
                                                            .PADDING_SIZE_EXTRA_SMALL),
                                                    SizedBox(
                                                        height: Dimensions
                                                            .PADDING_SIZE_SMALL),
                                                    Row(children: [
                                                      Container(
                                                          height: 10,
                                                          width: 10,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .color)),
                                                      SizedBox(
                                                          width: Dimensions
                                                              .PADDING_SIZE_EXTRA_SMALL),
                                                      Text(
                                                        '${orderController.finshOrderModel.value.orderId![index].createdAt!.substring(0, 11)}',
                                                        style: rubikRegular.copyWith(
                                                            fontSize: Dimensions
                                                                .FONT_SIZE_SMALL,
                                                            color: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .color),
                                                      ),
                                                    ]),
                                                  ]),
                                            ),
                                          ]),
                                        ]),
                                  ),
                                )),
                      ))
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: CustomText(
                          text: 'لا يوجد طلبات',
                          color: AppColors.blackDark,
                          fontSize: 30,
                        ),
                      ),
                    ),
            )
          ],
        ),
      );
    }));
  }
}
