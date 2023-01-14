import 'package:delivery_boy/module/profile/profile_screen.dart';
import 'package:get/get.dart';

import '../helper/location_helper.dart';
import '../routes/app_pages.dart';
import '../utils/export.dart';
import 'laundry_delivary/orders/server/server_order.dart';
import 'laundry_delivary/orders/view/deivary_order_view/delivary_order_screen.dart';
import 'laundry_delivary/orders/view/history_order_screen.dart';
import 'laundry_delivary/orders/view/receipt_view/screen/receipt_screen.dart';

class AppController extends GetxController {
  String? token;
  int? selectedPageIndex = 0;

  List<Widget> screens = [
    ReceiptFromUserScreen(),
    DelivaryFromUserScreen(),
    OrderHistoryScreen(),
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
    await LocationHelper().getCurrentLocation();

    if (SHelper.sHelper.getToken() != null) {
      ServerOrder.instance.getOrders();
      Future.delayed(Duration(seconds: 6), () {
        return Get.offAllNamed(Routes.MAIN);
      });
    } else {
      return Get.offAllNamed(Routes.SIGNIN);
    }
  }

  @override
  void onInit() async {
    await validateSession();
    super.onInit();
  }
}
