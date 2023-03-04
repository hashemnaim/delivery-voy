import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/location_helper.dart';
import '../../helper/shared_preferences_helpar.dart';
import '../../routes/app_pages.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    LocationHelper().getCurrentLocation();

    if (SHelper.sHelper.getToken() != null) {
      // Future.delayed(Duration(seconds: 2), () {
      return const RouteSettings(name: Routes.MAIN);
      // });
    } else {
      return const RouteSettings(name: Routes.SIGNIN);
    }
  }
}
