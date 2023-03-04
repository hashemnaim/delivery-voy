import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/export.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import '../../../server/base_client.dart';
import '../../../utils/constants.dart';
import '../../Widget/custom_dialoug.dart';
import '../../orders/server/server_order.dart';
import '../../profile/user_model.dart';

class ServerAuth {
  ServerAuth._();
  static ServerAuth instance = ServerAuth._();
  Dio? dio;

  initApi() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  /////////////////////////////////////////////////////////////
  login({String? mobile, String? password}) async {
    CustomDialougs.utils.showCustomLoading();
    String? fcmToken = SHelper.sHelper.getFcmToken();
    await BaseClient.baseClient.post(Constants.loginUrl, data: {
      "phone": mobile,
      "password": password,
      "fcm_token": fcmToken,
    }, onSuccess: (response) async {
      if (response.data['status'] == 200) {
        await SHelper.sHelper.setToken(response.data['token']);
        await SHelper.sHelper.addUser(UserData.fromJson(response.data['user']));
        // response.data['user']["rool_id"] == 1
        //     ?
        await ServerOrder.instance.getOrders();
        ServerOrder.instance.getSupplierDeliveries();
        //     :
        // await ServerOrder.instance.getOrdersHomeService();

        Get.offAllNamed(Routes.MAIN);
      } else {
        BotToast.closeAllLoading();
        BotToast.showText(text: response.data["msg"], contentColor: Colors.red);
      }
    });
  }
}
