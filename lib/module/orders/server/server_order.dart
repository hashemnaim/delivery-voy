import 'dart:convert';
import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_boy/module/orders/controller/controller_order.dart';
import 'package:delivery_boy/module/orders/model/order_modal.dart';
import 'package:delivery_boy/module/orders/model/product_model.dart';
import 'package:delivery_boy/utils/constants.dart';
import 'package:get/get.dart';
import '../model/customer_model.dart';
import '../model/detailsProduct_model.dart';
import '../../../server/base_client.dart';
import '../../../utils/export.dart';
import '../../Widget/custom_dialoug.dart';
import '../model/details_home_model.dart';

class ServerOrder {
  ServerOrder._();
  static ServerOrder instance = ServerOrder._();
  OrderController orderController = Get.find();
//////////////////////////////////////////////////////////////////////////

  getOrders({String? date}) async {
    await BaseClient.baseClient.get(Constants.supplierOrdersUrl,
        onSuccess: (response) {
      orderController.receiptUserOrderModel.clear();
      orderController.receiptDoneUserOrderModel.clear();
      orderController.receiptLandryOrderModel.clear();
      orderController.inProgreesLandryOrderModel.clear();
      orderController.inDelivaryOrderModel.clear();
      orderController.DoneOrderModel.clear();
      orderController.HoledOrderModel.clear();
      orderController.finshOrderModel.clear();
      if (response.data['status'] == 200) {
        if (response.data['data'] != null) {
          orderController.newOrderModel.value = <OrderModel>[];
          response.data['data'].forEach((v) {
            orderController.newOrderModel.add(new OrderModel.fromJson(v));
          });
        }
        for (OrderModel orderModel in orderController.newOrderModel) {
          switch (orderModel.statusId) {
            case "2":
              orderController.receiptUserOrderModel.add(orderModel);
              break;
            case "3":
              orderController.receiptDoneUserOrderModel.add(orderModel);
              break;
            case "4":
              orderController.receiptDoneUserOrderModel.add(orderModel);
              break;
            case "5":
              orderController.inProgreesLandryOrderModel.add(orderModel);
              break;
            case "6":
              orderController.inDelivaryOrderModel.add(orderModel);
              break;
            case "8":
              orderController.DoneOrderModel.add(orderModel);
              break;
            case "9":
              date = date ?? DateTime.now().toString();
              orderController.finshOrderModel.value = orderController
                  .newOrderModel
                  .where((element) =>
                      element.updated_at!.substring(0, 10) ==
                          date!.substring(0, 10) &&
                      element.statusId == "9")
                  .toList();
              break;

            case "10":
              date = date ?? DateTime.now().toString();
              orderController.HoledOrderModel.value = orderController
                  .newOrderModel
                  .where((element) =>
                      element.updated_at!.substring(0, 10) ==
                          date!.substring(0, 10) &&
                      element.statusId == "10")
                  .toList();

              break;
            // case "7":
            //   orderController.finshOrderModel.add(idStatus);
            //   break;
            default:
              break;
          }
        }
      }
    });
  }
//////////////////////////////////////////////////////////////////////////

  // getOrdersHomeService() async {
  //   await BaseClient.baseClient.get(Constants.homeOrdersUrl,
  //       onSuccess: (response) {
  //     orderController.receiptUserOrderModel.clear();
  //     orderController.receiptDoneUserOrderModel.clear();
  //     orderController.receiptLandryOrderModel.clear();
  //     orderController.delivaryDoneUserOrderModel.clear();
  //     orderController.finshOrderModel.clear();
  //     if (response.data['status'] == 200) {
  //       orderController.newOrderModel.value =
  //           OrderModel.fromJson(response.data);

  //       for (Data idStatus in orderController.newOrderModel.value.data!) {
  //         switch (idStatus.statusId) {
  //           case "2":
  //             orderController.receiptUserOrderModel.add(idStatus);
  //             break;
  //           case "3":
  //             orderController.receiptDoneUserOrderModel.add(idStatus);
  //             break;
  //           case "5":
  //             orderController.receiptLandryOrderModel.add(idStatus);
  //             break;
  //           case "6":
  //             orderController.delivaryDoneUserOrderModel.add(idStatus);
  //             break;
  //           case "7":
  //             orderController.finshOrderModel.add(idStatus);
  //             break;
  //           default:
  //             break;
  //         }
  //       }
  //     }
  //   });
  // }

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
    log("====>" + statusId);
    CustomDialougs.utils.showCustomLoading();
    await BaseClient.baseClient.post(Constants.changeStatusOrder, data: {
      "order_id": orderId,
      "status_id": statusId,
    }, onSuccess: (response) async {
      // if (response.data['status'] == 200) {
      //   await getOrders();
      // }
      BotToast.closeAllLoading();
    });
  }
  //////////////////////////////////////////////////////////////////////////

  AddDeliveryOrder(int? orderId, String deliveryId, String status) async {
    log("123" + status);

    CustomDialougs.utils.showCustomLoading();
    await BaseClient.baseClient.post(Constants.addDeliveryOrderUrl, data: {
      "order_id": orderId,
      "delivery_id": deliveryId,
    }, onSuccess: (response) async {
      log("3333" + status);
      if (response.data['status'] == 200) {
        await changeStatus(orderId, status);
      }
      BotToast.closeAllLoading();
    });
  }

  //////////////////////////////////////////////////////////////////////////
  getSupplierDeliveries() async {
    await BaseClient.baseClient.get(Constants.supplierdeliveryOrdersUrl,
        onSuccess: (response) {
      if (response.data['status'] == 200) {
        if (response.data['data'] != null) {
          orderController.delivaryModel.value = <DelivaryModel>[];
          response.data['data'].forEach((v) {
            orderController.delivaryModel.add(new DelivaryModel.fromJson(v));
          });
        }
      }
    });
  }
}
