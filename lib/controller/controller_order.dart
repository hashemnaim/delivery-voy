import 'package:delivery_boy/model/HistoryOrderModel.dart';
import 'package:delivery_boy/model/detailsProduct_model.dart';
import 'package:delivery_boy/model/order_modal.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  Rx<OrderModel> newOrderModel = OrderModel().obs;
  Rx<FinishOrderModel> finshOrderModel = FinishOrderModel().obs;
  Rx<DetailsProductModel> detailsProdact = DetailsProductModel().obs;
}
