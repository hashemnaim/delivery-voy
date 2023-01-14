import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import '../translations/tanslation_controller.dart';
import '../utils/export.dart';
import 'Widget/custom_dialoug.dart';
import 'laundry_delivary/orders/server/server_order.dart';
import 'laundry_delivary/orders/view/receipt_view/widget/nav_bar_custom.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AppController appController = Get.find();
  MyLocaleController myLocaleController = Get.find();
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (appController.screens != 0) {
          appController.setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).cardColor,
            leadingWidth: 100,
            actions: [
              IconButton(
                  icon: Icon(Icons.refresh,
                      size: 30,
                      color: Theme.of(context).textTheme.bodyText1!.color),
                  onPressed: () async {
                    CustomDialougs.utils.showCustomLoading();

                    await ServerOrder.instance.getOrders();
                    BotToast.closeAllLoading();
                  })
            ],
            leading: GestureDetector(
                onTap: () async {
                  Locale locale = SHelper.sHelper.getLanguge() == "ar"
                      ? Locale("en")
                      : Locale("ar");

                  myLocaleController.updateLanguage(locale.languageCode);
                  await SHelper.sHelper.setToken(locale.languageCode);
                },
                child: Container(
                    child: Row(children: [
                  IconButton(
                      icon: Icon(
                        Icons.language,
                        size: 30,
                        color: AppColors.blackLight,
                      ),
                      onPressed: () async {
                        Locale locale = SHelper.sHelper.getLanguge() == "ar"
                            ? Locale("en")
                            : Locale("ar");

                        myLocaleController.updateLanguage(locale.languageCode);
                      }),
                  Obx(() => CustomText(
                      text:
                          myLocaleController.languageView == "ar" ? "En" : "ع",
                      color: AppColors.blackLight,
                      fontSize: 20.h))
                ]))),
            centerTitle: true,
            title: CustomPngImage("icon", height: 140, width: 180)),
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: NavBottomBarCustom(),
        body: GetBuilder<AppController>(
            id: "navBottomBar",
            builder: (controller) =>
                controller.screens[controller.selectedPageIndex!]),
      ),
    );
  }

  BottomNavigationBarItem barItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding:
            index == 0 ? EdgeInsets.zero : const EdgeInsets.only(left: 8.0),
        child: Obx(
          () => Icon(
            icon,
            color: index == appController.screens
                ? AppColors.primary
                : Colors.grey,
          ),
        ),
      ),
      label: label,
    );
  }
}
