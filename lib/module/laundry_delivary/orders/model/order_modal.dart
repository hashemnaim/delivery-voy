import 'address_model.dart';

class OrderModel {
  int? status;
  String? msg;
  List<Data>? data;

  OrderModel({this.status, this.msg, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? code;
  String? status;
  String? statusId;
  String? note;
  String? receiptTime;
  String? deliveryTime;
  String? deliveryTime2;
  String? receiptDate;
  String? deliveryDate;
  String? deliveryDate2;
  String? delivery;
  int? subTotal;
  int? deliveryPrice;
  int? total;
  Customer? customer;
  Address? address;

  Data(
      {this.id,
      this.code,
      this.status,
      this.statusId,
      this.note,
      this.receiptTime,
      this.deliveryTime,
      this.deliveryTime2,
      this.receiptDate,
      this.deliveryDate,
      this.deliveryDate2,
      this.delivery,
      this.subTotal,
      this.deliveryPrice,
      this.total,
      this.customer,
      this.address});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'].toString();
    status = json['status'];
    statusId = json['status_id'].toString();
    note = json['note'];
    receiptTime = json['receipt_time'];
    deliveryTime = json['delivery_time'];
    deliveryTime2 = json['delivery_time2'];
    receiptDate = json['receipt_date'];
    deliveryDate = json['delivery_date'];
    deliveryDate2 = json['delivery_date2'];
    delivery = json['delivery'];
    subTotal = json['sub_total'];
    deliveryPrice = json['delivery_price'];
    total = json['total'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
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
    data['delivery_time2'] = this.deliveryTime2;
    data['receipt_date'] = this.receiptDate;
    data['delivery_date'] = this.deliveryDate;
    data['delivery_date2'] = this.deliveryDate2;
    data['delivery'] = this.delivery;
    data['sub_total'] = this.subTotal;
    data['delivery_price'] = this.deliveryPrice;
    data['total'] = this.total;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? phone;

  Customer({this.id, this.name, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}
