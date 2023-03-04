import 'product_model.dart';

class ListProductModel {
  int? status;
  String? msg;
  List<Product>? data;
  List<Product>? allData;

  ListProductModel({this.status, this.msg, this.data, this.allData});

  ListProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
    if (json['data'] != null) {
      allData = <Product>[];
      json['data'].forEach((v) {
        allData!.add(new Product.fromJson(v));
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
