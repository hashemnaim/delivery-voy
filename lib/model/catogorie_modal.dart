import 'cart_modal.dart';

class CategorieModel {
  int? status;
  String? message;
  CategorieData? data;

  CategorieModel({this.status, this.message, this.data});

  CategorieModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? new CategorieData.fromJson(json['data']) : null;
  }
}

class CategorieData {
  List<Categories>? categories;
  List<Entrees>? entrees;

  CategorieData({this.categories, this.entrees});

  CategorieData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }
}

class Categories {
  int? id;
  String? name;
  int? isEntrees;
  String? icon;
  // List<Filters> filters;

  Categories({
    this.id,
    this.name,
    this.isEntrees,
    this.icon,
    // this.filters
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isEntrees = json['is_entrees'];
    icon = json['icon'];
    // if (json['filters'] != null) {
    //   filters = new List<Filters>();
    //   json['filters'].forEach((v) {
    //     filters.add(new Filters.fromJson(v));
    //   });
    // }
  }
}

// class Filters {
//   int id;
//   String name;

//   Filters({this.id, this.name});

//   Filters.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
