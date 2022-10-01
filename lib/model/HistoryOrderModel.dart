import 'order_modal.dart';

class FinishOrderModel {
  int? code;
  bool? status;
  String? message;
  List<OrderId>? orderId;

  FinishOrderModel({this.code, this.status, this.message, this.orderId});

  FinishOrderModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['order_id'] != null) {
      orderId = <OrderId>[];
      json['order_id'].forEach((v) {
        orderId!.add(new OrderId.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.orderId != null) {
      data['order_id'] = this.orderId!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderId {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? totalPrice;
  String? status;
  String? statusCode;
  String? deliveryCost;
  String? tax;
  String? time;
  String? day;

  String? mobile;
  String? discount;
  String? cartonId;
  String? driverId;
  String? code;
  String? cash;
  String? addressId;
  String? sumPoints;
  User? user;
  ShippingAddress? shippingAddress;

  OrderId(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.totalPrice,
      this.status,
      this.statusCode,
      this.deliveryCost,
      this.tax,
      this.time,
      this.day,
      this.mobile,
      this.discount,
      this.cartonId,
      this.driverId,
      this.code,
      this.cash,
      this.addressId,
      this.sumPoints,
      this.user,
      this.shippingAddress});

  OrderId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    totalPrice = json['total_price'];
    status = json['status'];
    statusCode = json['status_code'];
    deliveryCost = json['delivery_cost'];
    tax = json['tax'];
    time = json['time'];
    day = json['day'];

    mobile = json['mobile'];
    discount = json['discount'];
    cartonId = json['carton_id'];
    driverId = json['driver_id'];
    code = json['code'];
    cash = json['cash'];
    addressId = json['address_id'];
    sumPoints = json['sum_points'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['delivery_cost'] = this.deliveryCost;
    data['tax'] = this.tax;
    data['time'] = this.time;
    data['day'] = this.day;

    data['mobile'] = this.mobile;
    data['discount'] = this.discount;
    data['carton_id'] = this.cartonId;
    data['driver_id'] = this.driverId;
    data['code'] = this.code;
    data['cash'] = this.cash;
    data['address_id'] = this.addressId;
    data['sum_points'] = this.sumPoints;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    return data;
  }
}
