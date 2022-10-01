import 'package:delivery_boy/controller/controller_cart.dart';
import 'package:delivery_boy/model/cart_modal.dart';
import 'package:delivery_boy/values/export.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class ServerCart {
  ServerCart._();
  static ServerCart instance = ServerCart._();
  Dio? dio;
  AppController appController = getx.Get.find();
  CartController cartController = getx.Get.find();

  initApi() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

////////////////////////////////////////////////////////////////////////////////
  getCart() async {
    initApi();

    try {
      Response response = await dio!.post(
        url + 'cart/data',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
        }),
      );
      if (response.data["status"] == 200) {
        cartController.cartData.value = CartModel.fromJson(response.data);
      } else if (response.data["status"] == 402) {
        // setToast(response.data["message"], Colors.red);
        cartController.cartData.value = CartModel.fromJson(response.data);
      }
    } catch (e) {}
  }

  ////////////////////////////////////////////////////////////////////////////////
  getOrder() async {
    initApi();

    try {
      await dio!.post(
        url + 'order/add',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
        }),
      );
      getCart();
    } catch (e) {}
  }
////////////////////////////////////////////////////////////////////////////////

  removeCart(String itemId) async {
    initApi();
    appController.pr.show(message: '');
    try {
      await dio!.post(
        url + 'cart/remove',
        data: {"item_id": itemId},
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
        }),
      );

      getCart();

      appController.pr.hide();
    } catch (e) {
      appController.pr.hide();
    }
  }
///////////////////////////////////////////////////////////////////////////////

  updateCart(String itemId, int quantity) async {
    try {
      appController.pr.show(message: '');

      await dio!.post(
        url + 'cart/update',
        data: {"item_id": itemId, "quantity": quantity},
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
        }),
      );
      getCart();
      appController.pr.hide();
    } catch (e) {
      appController.pr.hide();
    }
  }

///////////////////////////////////////////////////////////////////

  setStudent(int isStudent) async {
    initApi();
    try {
      await dio!.post(url + 'cart/student',
          data: {"is_student": isStudent},
          options: Options(headers: {
            'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
          }));
    } catch (e) {}
  }

///////////////////////////////////////////////////////////////////
  setDelivery(String delivery) async {
    initApi();
    appController.pr.show(message: '');
    try {
      Response response = await dio!.post(url + '/cart/delivery',
          data: {"delivery_method": delivery},
          options: Options(headers: {
            'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
          }));

      getOrder();
      // setToast("Lagt til i handlekurven", Colors.green);
      return response.data;
    } catch (e) {
      appController.pr.hide();
    }
  }

////////////////////////////////////////////////////////////////////////////////
  setAddCart(Map data) async {
    initApi();
    print(data);
    // try {
    //   appController.pr.show(message: '');
    Response response = await dio!.post(
      url + 'cart/add',
      data: data,
      options: Options(
          headers: {'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'}),
    );
    if (response.data["status"] == 200) {
      // setToast("Lagt til i handlekurven", Colors.green);
      getCart();
    } else if (response.data["status"] == 402) {
      // setToast(response.data["message"], Colors.red);
    }
    appController.pr.hide();
    // } catch (e) {
    //   appController.pr.hide();
    // }
  }

////////////////////////////////////////////////////////////////////////////////
  setCash() async {
    initApi();
    print('payment/cash');
    try {
      appController.pr.show(message: '');
      Response response = await dio!.post(
        url + 'payment/cash',
        options: Options(
            headers: {'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'}),
      );
      print(response.data);
      // cartController.orderModel.value = OrderModel.fromJson(response.data);

      appController.pr.hide();
    } catch (e) {
      appController.pr.hide();
    }
  }

////////////////////////////////////////////////////////////////////////////////
  setVipps() async {
    initApi();

    try {
      appController.pr.show(message: '');
      Response response = await dio!.post(
        url + 'payment/vipps',
        options: Options(
            headers: {'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'}),
      );
      print(response);
      // cartController.orderModel.value = OrderModel.fromJson(response.data);
      appController.pr.hide();
    } catch (e) {
      appController.pr.hide();
    }
  }

////////////////////////////////////////////////////////////////////////////////
  setListCards() async {
    initApi();

    try {
      // appController.pr.show(message: '');
      await dio!.post(
        url + 'payment/strip_cards',
        options: Options(
            headers: {'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'}),
      );

      // appController.pr.hide();
    } catch (e) {
      // appController.pr.hide();
    }
  }

////////////////////////////////////////////////////////////////////////////////
  setAddCard({
    int? number,
    int? expDate,
    int? cvc,
    // int saveCard,
  }) async {
    initApi();
    print(number);
    print(expDate);
    print(cvc);

    try {
      appController.pr.show(message: '');
      Response response = await dio!.post(
        url + 'payment/strip_add_card',
        data: {
          "number": number,
          "exp_date": expDate,
          "cvc": cvc,
          // "save_card": save_card,
        },
        options: Options(
            headers: {'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'}),
      );

      appController.pr.hide();
      if (response.data['data']['card'] == null) {
        // setToast(response.data['data'], Colors.red);
      } else {
        // setToast("La til", Colors.green);
        // save_card == 1 ? setlistCard() : null;
        // await setCreateOrder(
        //     "online", DateTime.now().toString(), "", map['data']["card"]['id']);
      }
    } catch (e) {
      appController.pr.hide();
    }
  }

////////////////////////////////////////////////////////////////////////////////
  setRemoveCard() async {
    initApi();

    try {
      appController.pr.show(message: '');
      Response response = await dio!.post(
        url + 'payment/strip_remove_card',
        options: Options(
            headers: {'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'}),
      );

      appController.pr.hide();
      if (response.statusCode == 200) {
        // setToast(response.data['data'], Colors.red);
      }
    } catch (e) {
      appController.pr.hide();
    }
  }
}
