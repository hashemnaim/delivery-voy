import 'package:delivery_boy/values/export.dart';
import 'package:get/get.dart';

import 'custom_bottom_app_bar.dart';

class NavCustomer extends StatelessWidget {
  AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomBottomAppBar(
        onTabSelected: (index) {
          appController.indexNav.value = index!;
          print(appController.indexNav);
        },
        items: [
          CustomAppBarItem(
              icon: "assets/svg/icon-store.svg", titel: "الرئيسية"),
          CustomAppBarItem(
              icon: "assets/24svg/repeat.svg", titel: "سجل الطلبات"),
          // CustomAppBarItem(icon: "assets/24svg/knife.svg", titel: "Tilbud"),
          CustomAppBarItem(
              icon: "assets/svg/icon-settings.svg", titel: "تسجيل الخروج"),
        ]);
  }
}
