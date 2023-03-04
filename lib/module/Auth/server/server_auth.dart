import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/export.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart' as getx;
import '../../../server/base_client.dart';
import '../../../utils/constants.dart';
import '../../Widget/custom_dialoug.dart';
import '../../laundry_delivary/orders/server/server_order.dart';
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
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? fcmToken = await firebaseMessaging.getToken();
    await BaseClient.baseClient.post(Constants.loginUrl, data: {
      "phone": mobile,
      "password": password,
      "fcm_token": fcmToken,
    }, onSuccess: (response) async {
      if (response.data['status'] == 200) {
        await SHelper.sHelper.setToken(response.data['token']);
        await SHelper.sHelper.addUser(UserData.fromJson(response.data['user']));
        response.data['user']["rool_id"] == 1
            ? await ServerOrder.instance.getOrders()
            : await ServerOrder.instance.getOrdersHomeService();

        Get.offAllNamed(Routes.MAIN);
      } else {
        BotToast.closeAllLoading();
        BotToast.showText(text: response.data["msg"], contentColor: Colors.red);
      }
    });
  }
// ///////////////////////////////////////////////////////////////////

//   verifyMobile({required String mobileNumber, int? type}) async {
//     initApi();
//     String newMobile;

//     if (mobileNumber.substring(0, 1) == "0") {
//       newMobile = mobileNumber.substring(1);
//     } else {
//       newMobile = mobileNumber;
//     }

//     try {
//       Response response = await dio!.post(Constants.loginUrl ,
//           data: {
//             "mobile":  newMobile,
//           },
//           options: Options(headers: {
//             'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
//           }));
//       authController.code = response.data["data"]["code"];
//       if (type == 1) {
//       } else {
//         // getx.Get.to(() => VerificationScreen());
//       }
//     } catch (e) {
//       getx.Get.snackbar(
//         "mobile Faild",
//         "",
//         duration: Duration(seconds: 3),
//       );
//     }
//   }

// ///////////////////////////////////////////////////////////////////

//   sendCode(String code, int type) async {
//     initApi();

//     try {
//       Response response = await dio!.post(url + 'activeCode',
//           data: {
//             "code": code,
//           },
//           options: Options(headers: {
//             'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
//           }));

//       if (response.data["status"] == 200) {
//         if (type == 1) {
//           getx.Get.back();
//           // setToast("Mobilnummeret er endret", Colors.green);
//         } else {
//           await appController.getApi();
//           appController.indexNav.value = 0;
//           getx.Get.offAll(() => MainScreen());
//         }
//       } else {
//         getx.Get.snackbar(
//           response.data["message"],
//           "",
//           duration: Duration(seconds: 3),
//         );
//       }
//     } catch (e) {
//       getx.Get.snackbar(
//         "mobile Faild",
//         "",
//         duration: Duration(seconds: 3),
//       );
//     }
//   }

// ////////////////////////////////////////////////////////////////////
//   forgetPassword({String? email}) async {
//     initApi();
//     try {
//       await dio!.post(
//         url + 'change-password',
//         data: {
//           "email": email,
//         },
//       );

//       // setToast("Passordet er sendt", Colors.green);
//     } catch (e) {
//       CustomDialougs.utils.showDialoug(messageKey: 'error', titleKey: 'error');
//     }
//   }

// ////////////////////////////////////////////////////////////////////
//   deactivate(String password) async {
//     initApi();
//     try {
//       var response = await dio!.post(
//         Constants.l + 'deactivate',
//         data: {
//           "password": password,
//         },
//       );

//       await SHelper.sHelper.clearSp();
//       if (response.data["success"] == null) {
//         CustomDialougs.utils
//             .showDialoug(messageKey: response.data["error"], titleKey: 'error');
//       } else {
//         // setToast(response.data["success"], Colors.red);
//         // getx.Get.offAll(() => LogInScreen());
//       }
//     } catch (e) {
//       CustomDialougs.utils.showDialoug(messageKey: "", titleKey: 'error');
//     }
//   }
}
