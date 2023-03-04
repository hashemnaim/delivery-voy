import 'address_model.dart';

class OrderModel {
  int? id;
  String? code;
  String? status;
  String? statusId;
  int? type;
  String? note;
  String? receiptTime;
  String? deliveryTime;
  String? receiptDate;
  String? deliveryDate;
  String? updated_at;
  String? delivery_name;
  String? subTotal;
  String? deliveryPrice;
  String? total;
  String? discountPrice;
  Customer? customer;
  Address? address;

  OrderModel(
      {this.id,
      this.code,
      this.status,
      this.statusId,
      this.type,
      this.note,
      this.receiptTime,
      this.deliveryTime,
      this.delivery_name,
      this.receiptDate,
      this.deliveryDate,
      this.subTotal,
      this.updated_at,
      this.deliveryPrice,
      this.total,
      this.discountPrice,
      this.customer,
      this.address});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    status = json['status'];
    statusId = json['status_id'];
    type = json['type'];
    note = json['note'];
    receiptTime = json['receipt_time'];
    deliveryTime = json['delivery_time'];
    receiptDate = json['receipt_date'];
    deliveryDate = json['delivery_date'];
    updated_at = json['updated_at'];
    delivery_name = json['delivery_name'];
    deliveryPrice = json['delivery_price'].toString();
    total = json['total'].toString();
    subTotal = json['sub_total'].toString();
    discountPrice = json['discount_price'].toString();
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
    data['type'] = this.type;
    data['note'] = this.note;
    data['receipt_time'] = this.receiptTime;
    data['delivery_time'] = this.deliveryTime;
    data['receipt_date'] = this.receiptDate;
    data['delivery_date'] = this.deliveryDate;
    data['sub_total'] = this.subTotal;
    data['delivery_price'] = this.deliveryPrice;
    data['total'] = this.total;
    data['discount_price'] = this.discountPrice;
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
