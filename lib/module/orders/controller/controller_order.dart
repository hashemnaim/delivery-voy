import 'package:delivery_boy/module/orders/model/detailsProduct_model.dart';
import 'package:delivery_boy/module/orders/model/order_modal.dart';
import 'package:delivery_boy/utils/export.dart';
import 'package:get/get.dart';

import '../model/customer_model.dart';
import '../model/details_home_model.dart';
import '../model/home_service_model.dart';

class OrderController extends GetxController {
  RxList<DataHomeServiceModel> HomeServiceOrderModel =
      <DataHomeServiceModel>[].obs;
  DetailsHomeModel detailsHomeModel = DetailsHomeModel();

  RxList<OrderModel> receiptUserOrderModel = <OrderModel>[].obs;
  RxList<OrderModel> receiptDoneUserOrderModel = <OrderModel>[].obs;
  RxList<OrderModel> inProgreesLandryOrderModel = <OrderModel>[].obs;
  RxList<OrderModel> receiptLandryOrderModel = <OrderModel>[].obs;
  RxList<OrderModel> inDelivaryOrderModel = <OrderModel>[].obs;
  RxList<OrderModel> DoneOrderModel = <OrderModel>[].obs;
  RxList<OrderModel> HoledOrderModel = <OrderModel>[].obs;
  RxList<OrderModel> newOrderModel = <OrderModel>[].obs;
  RxList<OrderModel> finshOrderModel = <OrderModel>[].obs;
  RxList<DelivaryModel> delivaryModel = <DelivaryModel>[].obs;
  DetailsOrderModel detailsProduct = DetailsOrderModel();
  Rx<TextEditingController> textEditingController =
      TextEditingController(text: "").obs;
  int lenght = 0;
  Rx<int> lood = 0.obs;
  String indexTap = "";

  Rx<DelivaryModel> delivaryId =
      DelivaryModel(id: "0", name: "اختر السواق").obs;
}
