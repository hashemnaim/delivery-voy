import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_boy/routes/app_pages.dart';
import 'package:delivery_boy/translations/localization_service.dart';
import 'package:delivery_boy/translations/tanslation_controller.dart';
import 'package:delivery_boy/utils/export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'helper/fcm_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SHelper.sHelper.initSharedPrefrences();
  await FcmHelper.fcmHelper.initFcm();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Get.put(MyLocaleController(), permanent: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) => GetMaterialApp(
              builder: BotToastInit(), //1. call BotToastInit
              navigatorObservers: [BotToastNavigatorObserver()],
              debugShowCheckedModeBanner: false,
              locale: Get.find<MyLocaleController>().iniallingLang,
              translations: LocalizationService(),
              getPages: AppPages.routes,
              initialRoute: Routes.SPLASH,
            ));
  }
}
