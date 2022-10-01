import 'package:delivery_boy/controller/controller_order.dart';
import 'package:delivery_boy/model/HistoryOrderModel.dart';
import 'package:delivery_boy/model/detailsProduct_model.dart';
import 'package:delivery_boy/model/order_modal.dart';
import 'package:delivery_boy/values/export.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../helper/fcm_helper.dart';
import '../helper/notifications_helpers.dart';

class ServerOrder {
  ServerOrder._();
  static ServerOrder instance = ServerOrder._();
  Dio? dio;
  AppController appController = getx.Get.find();
  OrderController orderController = getx.Get.find();

  initApi() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }
//////////////////////////////////////////////////////////////////////////

  getOrders() async {
    initApi();

    try {
      Response response = await dio!.post(url + 'driver/my_orders',
          options: Options(headers: {
            'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
          }));

      if (response.data['code'] == 200) {
        orderController.newOrderModel.value =
            OrderModel.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
  }

  ////////////////////
  getOrderId(int idOrder) async {
    initApi();
    appController.pr.show(message: '');

    try {
      Response response = await dio!.post(url + 'order/orders',
          data: {"order_id": idOrder},
          options: Options(headers: {
            'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
          }));

      if (response.data['code'] == "200") {
        orderController.detailsProdact.value =
            DetailsProductModel.fromJson(response.data);
      }
      appController.pr.hide();
    } catch (e) {
      return null;
    }
  }
  //////////////////////////////////////////////////////////////////////////

  changeStatus(int? orderId, String fcmToken) async {
    initApi();
    appController.pr.show(message: '');

    try {
      Response response = await dio!.post(url + 'driver/change-status',
          data: {
            "order_id": orderId,
          },
          options: Options(headers: {
            'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
          }));
      appController.pr.hide();

      if (response.data['code'] == 200) {
        getOrders();
        getOrderFinish();
        FcmHelper.fcmHelper.sendNotificationToUser(fcmToken: fcmToken);
      }
    } catch (e) {
      return null;
    }
  }
  //////////////////////////////////////////////////////////////////////////

  getOrderFinish() async {
    initApi();

    try {
      Response response = await dio!.post(url + 'driver/finish_order',
          options: Options(headers: {
            'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
          }));

      if (response.data['code'] == 200) {
        orderController.finshOrderModel.value =
            FinishOrderModel.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
  }
}
