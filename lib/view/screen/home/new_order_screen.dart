import 'package:delivery_boy/controller/controller_order.dart';
import 'package:delivery_boy/server/server_order.dart';
import 'package:delivery_boy/values/export.dart';
import 'package:get/get.dart';

import 'widget/order_widget.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  OrderController orderController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/images/background.png"),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    Expanded(
                      child: RefreshIndicator(
                        key: _refreshIndicatorKey,
                        child: orderController.newOrderModel.value.orderId!
                                    .processing!.length !=
                                0
                            ? ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: orderController.newOrderModel.value
                                    .orderId!.processing!.length,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                itemBuilder: (context, index) => OrderWidget(
                                  orderModel: orderController
                                      .newOrderModel.value.orderId!.processing!,
                                  index: index,
                                ),
                              )
                            : Center(
                                child: CustomText(
                                  text: 'لا يوجد طلبات',
                                  fontSize: 20,
                                ),
                              ),
                        displacement: 0,
                        color: AppColors.primary,
                        backgroundColor: AppColors.primary,
                        onRefresh: () {
                          return ServerOrder.instance.getOrders();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
