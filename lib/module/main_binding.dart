import 'package:delivery_boy/module/print/controller_print.dart';
import 'package:delivery_boy/module/print/invoice_settings.controller.dart';
import 'package:get/get.dart';
import 'orders/controller/product_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() async {
    // Get.lazyPut(() => InvoiceSettingsController(), fenix: true);

    Get.lazyPut(() => PrintController(), fenix: true);

    Get.lazyPut(() => ProductController(), fenix: true);
  }
}
