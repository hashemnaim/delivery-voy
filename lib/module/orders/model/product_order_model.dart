class ProductOrder {
  int? id;
  String? name;
  String? category;
  String? sub_category;
  int? qty;
  int? parentId;
  num? total_product;
  String? price_type_id;

  ProductOrder(
      {this.id,
      this.name,
      this.category,
      this.sub_category,
      this.price_type_id,
      this.total_product,
      this.parentId,
      this.qty});

  ProductOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['product_name'];
    qty = int.parse(json['qty'].toString());
    price_type_id = json['service_price_id'].toString();
    parentId = 0;
    total_product = json['total_product'];
    category = json['category'];
    sub_category = json['sub_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.id;
    data['price_type_id'] = this.price_type_id;
    data['quantity'] = this.qty;
    data['parentId'] = this.parentId;

    return data;
  }
}
