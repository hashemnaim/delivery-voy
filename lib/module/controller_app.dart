import 'package:delivery_boy/module/profile/profile_screen.dart';
import 'package:get/get.dart';
import '../helper/location_helper.dart';
import '../routes/app_pages.dart';
import '../utils/export.dart';
import 'orders/server/server_order.dart';
import 'orders/view/deivary_order_view/delivary_order_screen.dart';
import 'orders/view/history_order/history_screen.dart';
import 'orders/view/receipt_view/screen/receipt_screen.dart';

class AppController extends GetxController {
  String? token;
  int? selectedPageIndex = 0;

  List<Widget> screens = [
    ReceiptFromUserScreen(),
    DelivaryFromUserScreen(),
    HistoryOrderScreen(),
    ProfileScreen()
  ];

  changeIndexBar(int? index, bool isHome) {
    selectedPageIndex = index;
    if (isHome == false) {
      Get.offNamed(Routes.MAIN);
    }
    update(["navBottomBar"]);
  }

  ///////////////////////////////////////////
  setPage(int value) {
    selectedPageIndex = value;
    update(["pageIndex"]);
  }

  validateSession() async {
    LocationHelper().getCurrentLocation();
    if (SHelper.sHelper.getToken() != null) {
      ServerOrder.instance.getOrders();
      ServerOrder.instance.getSupplierDeliveries();
      Future.delayed(Duration(milliseconds: 4000), () {
        return Get.offAllNamed(Routes.MAIN);
      });
    } else {
      Future.delayed(Duration(milliseconds: 4000), () {
        return Get.offAllNamed(Routes.SIGNIN);
      });
      // Get.offAllNamed(Routes.SIGNIN);
    }
  }

  @override
  void onInit() async {
    validateSession();
    super.onInit();
  }
}
