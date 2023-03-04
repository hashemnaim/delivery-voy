import 'dart:convert';
import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_boy/module/laundry_delivary/orders/controller/controller_order.dart';
import 'package:delivery_boy/module/laundry_delivary/orders/model/order_modal.dart';
import 'package:delivery_boy/module/laundry_delivary/orders/model/product_model.dart';
import 'package:delivery_boy/utils/constants.dart';
import 'package:get/get.dart';
import '../model/detailsProduct_model.dart';
import '../../../../server/base_client.dart';
import '../../../../utils/export.dart';
import '../../../Widget/custom_dialoug.dart';
import '../model/details_home_model.dart';

class ServerOrder {
  ServerOrder._();
  static ServerOrder instance = ServerOrder._();
  OrderController orderController = Get.find();
  // ProductController productController = Get.find();
//////////////////////////////////////////////////////////////////////////

  getOrders({String? date}) async {
    await BaseClient.baseClient.get(Constants.deliveryOrdersUrl,
        onSuccess: (response) {
      orderController.receiptLandryOrderModel.clear();
      orderController.receiptDoneUserOrderModel.clear();
      orderController.delivaryLandrOrderModel.clear();
      orderController.delivaryDoneUserOrderModel.clear();
      orderController.finshOrderModel.clear();
      if (response.data['status'] == 200) {
        orderController.newOrderModel.value =
            OrderModel.fromJson(response.data);

        for (Data idStatus in orderController.newOrderModel.value.data!) {
          switch (idStatus.statusId) {
            case "3":
              orderController.receiptLandryOrderModel.add(idStatus);
              break;
            case "4":
              orderController.receiptDoneUserOrderModel.add(idStatus);
              break;
            case "6":
              orderController.delivaryLandrOrderModel.add(idStatus);
              break;
            case "7":
              orderController.delivaryDoneUserOrderModel.add(idStatus);
              break;
            case "9":
              date = date ?? DateTime.now().toString();
              // log(date!.substring(0, 10));
              // log(idStatus.updated_at!.toString());

              orderController.finshOrderModel.value = orderController
                  .newOrderModel.value.data!
                  .where((element) =>
                      element.updated_at!.substring(0, 10) ==
                      date!.substring(0, 10))
                  .toList();
              // log(idStatus.toString());
              // log(orderController.finshOrderModel.toString());
              // orderController.finshOrderModel.add(idStatus);
              break;
            default:
              break;
          }
        }
      }
    });
  }
//////////////////////////////////////////////////////////////////////////

  getOrdersHomeService() async {
    await BaseClient.baseClient.get(Constants.homeOrdersUrl,
        onSuccess: (response) {
      orderController.receiptDoneUserOrderModel.clear();
      orderController.receiptLandryOrderModel.clear();
      orderController.delivaryDoneUserOrderModel.clear();
      orderController.finshOrderModel.clear();
      if (response.data['status'] == 200) {
        orderController.newOrderModel.value =
            OrderModel.fromJson(response.data);

        for (Data idStatus in orderController.newOrderModel.value.data!) {
          switch (idStatus.statusId) {
            case "3":
              orderController.receiptDoneUserOrderModel.add(idStatus);
              break;
            case "5":
              orderController.receiptLandryOrderModel.add(idStatus);
              break;
            case "6":
              orderController.delivaryDoneUserOrderModel.add(idStatus);
              break;
            case "7":
              orderController.finshOrderModel.add(idStatus);
              break;
            default:
              break;
          }
        }
      }
    });
  }

//////////////////////////////////////////////////////////////////

  Future<DetailsOrderModel> getOrderDetails(int idOrder) async {
    await BaseClient.baseClient.post(Constants.orderDetailsOrder,
        data: {"order_id": idOrder}, onSuccess: (response) {
      if (response.data['status'] == 200) {
        orderController.detailsProduct =
            DetailsOrderModel.fromJson(response.data);
      }
      return orderController.detailsProduct;
    });
    return orderController.detailsProduct;
  }
//////////////////////////////////////////////////////////////////

  Future<DetailsHomeModel> getHomeOrderDetails(int idOrder) async {
    await BaseClient.baseClient.post(Constants.orderDetailsOrder,
        data: {"id": idOrder}, onSuccess: (response) {
      if (response.data['status'] == 200) {
        orderController.detailsHomeModel =
            DetailsHomeModel.fromJson(response.data);
      }
      return orderController.detailsHomeModel;
    });
    return orderController.detailsHomeModel;
  }

  ///////////////////////////////////////////////

  getAddOrderItems(int idOrder, List<Product> product) async {
    List<String> list = product.map((e) => json.encode(e.toJson())).toList();

    CustomDialougs.utils.showCustomLoading();
    await BaseClient.baseClient.post(Constants.addOrderItemsOrder,
        data: {"order_id": idOrder, "products_list": list.toString()},
        onSuccess: (response) {
      if (response.data['status'] == 200) {
        BotToast.closeAllLoading();

        BotToast.showText(
            text: "تمت الاضافة بنجاح", contentColor: AppColors.primary);
        Get.back();

        return true;
      } else {
        BotToast.closeAllLoading();

        return false;
      }
    });
  }

  getUpdateOrderItems(int idOrder, String notes, String num_meters) async {
    CustomDialougs.utils.showCustomLoading();
    await BaseClient.baseClient.post(Constants.updateDetailsOrder,
        data: {"id": idOrder, "notes": notes, "num_meters": num_meters},
        onSuccess: (response) async {
      BotToast.closeAllLoading();

      if (response.data['status'] == 200) {
        BotToast.showText(
            text: "تمت تعديل بنجاح", contentColor: AppColors.primary);
        orderController.textEditingController.value.clear();
        Get.back();
        ServerOrder.instance.getOrderDetails(idOrder);
        orderController.lood.value = 1; //to refrash listDetailsScreen
      }
    });
  }
  //////////////////////////////////////////////////////////////////////////

  changeStatus(int? orderId, String statusId) async {
    CustomDialougs.utils.showCustomLoading();
    log(statusId);
    await BaseClient.baseClient.post(Constants.changeStatusOrder, data: {
      "order_id": orderId,
      "status_id": statusId,
    }, onSuccess: (response) async {
      if (response.data['status'] == 200) {
        await getOrders();
      }
      BotToast.closeAllLoading();
    });
  }
  //////////////////////////////////////////////////////////////////////////

}
