import 'address_model.dart';
import 'home_service_model.dart';

class DetailsHomeModel {
  int? status;
  String? msg;
  DataDetailsHome? data;

  DetailsHomeModel({this.status, this.msg, this.data});

  DetailsHomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null
        ? new DataDetailsHome.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataDetailsHome {
  int? id;
  String? note;
  String? status;
  int? userId;
  String? userName;
  int? statusId;
  String? createdAt;
  String? arrivalDate;
  int? total;
  List<Products>? products;
  List<Periods>? periods;
  Address? address;

  DataDetailsHome(
      {this.id,
      this.note,
      this.status,
      this.userId,
      this.userName,
      this.statusId,
      this.createdAt,
      this.arrivalDate,
      this.total,
      this.products,
      this.periods,
      this.address});

  DataDetailsHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    status = json['status'];
    userId = json['user_id'];
    userName = json['user_name'];
    statusId = json['status_id'];
    createdAt = json['created_at'];
    arrivalDate = json['arrival_date'];
    total = json['total'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['periods'] != null) {
      periods = <Periods>[];
      json['periods'].forEach((v) {
        periods!.add(new Periods.fromJson(v));
      });
    }
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['note'] = this.note;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['status_id'] = this.statusId;
    data['created_at'] = this.createdAt;
    data['arrival_date'] = this.arrivalDate;
    data['total'] = this.total;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.periods != null) {
      data['periods'] = this.periods!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  int? price;
  int? qty;
  int? totalProduct;
  String? name;
  String? category;
  String? image;

  Products(
      {this.id,
      this.price,
      this.qty,
      this.totalProduct,
      this.name,
      this.category,
      this.image});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    qty = json['qty'];
    totalProduct = json['total_product'];
    name = json['name'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['total_product'] = this.totalProduct;
    data['name'] = this.name;
    data['category'] = this.category;
    data['image'] = this.image;
    return data;
  }
}
