class Product {
  int? id;
  String? name;
  String? category;
  int? qty;
  int? parentId;
  int? price_type_id;
  List<Services>? services;

  Product(
      {this.id,
      this.name,
      this.category,
      this.price_type_id,
      this.parentId,
      this.qty = 0});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    qty = 0;
    price_type_id = 0;
    parentId = 0;
    category = json['category'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.id;
    data['price_type_id'] = this.price_type_id;
    data['quantity'] = this.qty;
    data['parent_id'] = this.parentId;

    return data;
  }
}

class DataService {
  int? id;
  String? name;
  // String? desc;
  String? category;
  int? price;
  int? qty;
  // String? image;

  DataService(
      {this.id,
      this.name,
      // this.desc,
      this.category,
      this.price,
      // this.image,
      this.qty = 0});

  DataService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // desc = json['desc'];
    category = json['category'];
    price = json['price'];
    // image = json['image'];
    qty = 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    // data['desc'] = this.desc;
    data['category'] = this.category;
    data['price'] = this.price;
    // data['image'] = this.image;
    return data;
  }

  Map<String, dynamic> toJsonApi() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.id;
    data['qty'] = this.qty;

    return data;
  }
}

class Services {
  int? id;
  String? name;
  String? price;
  String? priceType;

  Services({this.id, this.name, this.price, this.priceType});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'].toString();
    priceType = json['price_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;

    return data;
  }
}
