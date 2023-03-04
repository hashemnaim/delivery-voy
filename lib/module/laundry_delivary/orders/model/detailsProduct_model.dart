import 'package:flutter/material.dart';

import 'address_model.dart';
import 'product_order_model.dart';

class DetailsOrderModel {
  int? status;
  String? msg;
  DataDetails? data;

  DetailsOrderModel({this.status, this.msg, this.data});

  DetailsOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new DataDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['DataDetails'] = this.data!.toJson();
    }
    return data;
  }
}

class DataDetails {
  int? id;
  String? code;
  String? status;
  String? statusId;
  String? userName;
  String? userPhone;
  String? note;
  String? receiptTime;
  String? deliveryTime;
  String? receiptDate;
  String? deliveryDate;
  String? delivery;
  String? payment;
  num? subTotal;
  num? deliveryPrice;
  num? total;
  List<Details>? details;
  Address? address;

  DataDetails(
      {this.id,
      this.code,
      this.status,
      this.userName,
      this.userPhone,
      this.statusId,
      this.note,
      this.receiptTime,
      this.deliveryTime,
      this.receiptDate,
      this.deliveryDate,
      this.delivery,
      this.payment,
      this.subTotal,
      this.deliveryPrice,
      this.total,
      this.details,
      this.address});

  DataDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'].toString();
    status = json['status'];
    statusId = json['status_id'].toString();
    userName = json['user_name'];
    userPhone = json['user_phone'];
    note = json['note'];
    receiptTime = json['receipt_time'];
    deliveryTime = json['delivery_time'];
    receiptDate = json['receipt_date'];
    deliveryDate = json['delivery_date'];
    delivery = json['delivery'];
    payment = json['payment'];
    subTotal = json['sub_total'];
    deliveryPrice = json['delivery_price'];
    total = json['total'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['status'] = this.status;
    data['status_id'] = this.statusId;
    data['note'] = this.note;
    data['receipt_time'] = this.receiptTime;
    data['delivery_time'] = this.deliveryTime;
    data['receipt_date'] = this.receiptDate;
    data['delivery_date'] = this.deliveryDate;
    data['delivery'] = this.delivery;
    data['sub_total'] = this.subTotal;
    data['delivery_price'] = this.deliveryPrice;
    data['total'] = this.total;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Details {
  int? id;
  String? productName;
  String? qty;
  String? price;
  String? type;
  String? priceType;
  String? image;
  int? totalProduct;
  String? catId;
  String? numMeters;
  int? servicePriceId;
  TextEditingController? textEditingController;
  String? category;
  String? subCategory;
  List<ProductOrder>? productOrder;

  Details(
      {this.productName,
      this.qty,
      this.price,
      this.id,
      this.type,
      this.servicePriceId,
      this.priceType,
      this.image,
      this.totalProduct,
      this.catId,
      this.textEditingController,
      this.numMeters,
      this.category,
      this.productOrder,
      this.subCategory});

  Details.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    qty = json['qty'].toString();
    id = json['id'];
    price = json['price'].toString();
    type = json['type'];
    priceType = json['price_type'];
    image = json['image'];
    numMeters = json['num_meters'].toString();
    servicePriceId = json['service_price_id'];
    totalProduct = json['total_product'];
    catId = json['cat_id'].toString();
    category = json['category'];
    textEditingController = TextEditingController(text: "");
    if (json['products'] != null) {
      productOrder = <ProductOrder>[];
      json['products'].forEach((v) {
        productOrder!.add(new ProductOrder.fromJson(v));
      });
    }
    subCategory = json['sub_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['type'] = this.type;
    data['price_type'] = this.priceType;
    data['image'] = this.image;
    data['total_product'] = this.totalProduct;
    data['cat_id'] = this.catId;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    return data;
  }
}
