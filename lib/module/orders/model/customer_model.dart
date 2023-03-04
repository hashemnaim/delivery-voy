class Customer {
  int? id;
  String? name;
  String? phone;

  Customer({this.id, this.name, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['business_name'];
    phone = json['phone'];
  }
}

class DelivaryModel {
  String? id;
  String? name;
  String? phone;

  DelivaryModel({this.id, this.name, this.phone});

  DelivaryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    phone = json['phone'];
  }
}
