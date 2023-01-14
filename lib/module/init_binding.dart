import 'package:get/get.dart';

import 'controller_app.dart';
import 'laundry_delivary/orders/controller/controller_order.dart';

class initBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(OrderController(), permanent: true);
    Get.put(AppController(), permanent: true);
  }
}
