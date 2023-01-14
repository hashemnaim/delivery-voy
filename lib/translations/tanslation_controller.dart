import 'package:get/get.dart';

import '../utils/export.dart';

class MyLocaleController extends GetxController {
  Locale iniallingLang = SHelper.sHelper.getLanguge() == null
      ? Get.deviceLocale!
      : Locale(SHelper.sHelper.getLanguge()!);
  Rx<String> languageView = (SHelper.sHelper.getLanguge() == null
          ? Get.deviceLocale!.languageCode
          : SHelper.sHelper.getLanguge()!)
      .obs;
  updateLanguage(String languageCode) async {
    Locale locale = Locale(languageCode);
    await Get.updateLocale(locale);
    await SHelper.sHelper.setLanguge(languageCode);
    languageView.value = languageCode;
    update(["languageCode"]);
  }
}
