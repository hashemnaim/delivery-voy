import 'package:delivery_boy/module/laundry_delivary/orders/model/detailsProduct_model.dart';
import 'package:delivery_boy/module/laundry_delivary/orders/model/order_modal.dart';
import 'package:delivery_boy/utils/export.dart';
import 'package:get/get.dart';

import '../model/details_home_model.dart';
import '../model/home_service_model.dart';

class OrderController extends GetxController {
  RxList<DataHomeServiceModel> HomeServiceOrderModel =
      <DataHomeServiceModel>[].obs;
  DetailsHomeModel detailsHomeModel = DetailsHomeModel();

  RxList<Data> receiptDoneUserOrderModel = <Data>[].obs;
  RxList<Data> receiptLandryOrderModel = <Data>[].obs;
  RxList<Data> delivaryLandrOrderModel = <Data>[].obs;
  RxList<Data> delivaryDoneUserOrderModel = <Data>[].obs;
  RxList<Data> HoledOrderModel = <Data>[].obs;
  Rx<OrderModel> newOrderModel = OrderModel().obs;
  RxList<Data> finshOrderModel = <Data>[].obs;
  DetailsOrderModel detailsProduct = DetailsOrderModel();
  Rx<TextEditingController> textEditingController =
      TextEditingController(text: "").obs;
  int lenght = 0;
  Rx<int> lood = 0.obs;
}
