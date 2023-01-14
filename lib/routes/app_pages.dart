import 'package:delivery_boy/module/init_binding.dart';
import 'package:get/get.dart';

import '../module/Auth/controller/auth_binding.dart';
import '../module/Auth/view/screen/logIn_screen.dart';
import '../module/main_binding.dart';
import '../module/main_screen.dart';
import '../module/middleware/mymiddleware.dart';
import '../module/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.SPLASH, page: () => SplashScreen(),
      binding: initBinding(),
      // middlewares: [MyMiddleWare()]
    ),
    GetPage(
        name: _Paths.MAIN, page: () => MainScreen(), binding: MainBinding()),
    GetPage(
        name: _Paths.SIGNIN, page: () => LoginScreen(), binding: AuthBinding()),
  ];
}
