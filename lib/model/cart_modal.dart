class CartModel {
  int? status;
  String? message;
  DataCartModel? dataCartModel;

  CartModel({this.status, this.message, this.dataCartModel});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    dataCartModel =
        json['data'] != null ? new DataCartModel.fromJson(json['data']) : null;
  }
}

class DataCartModel {
  int? countItems;
  var countQty;
  int? discountTotal;
  String? discountRate;
  String? deliveryPrice;
  int? total;
  List<Vat>? vat;
  int? grandTotal;
  // Null deliveryMethod;
  int? address;
  List<Items>? items;

  DataCartModel(
      {this.countItems,
      this.countQty,
      this.discountTotal,
      this.discountRate,
      this.deliveryPrice,
      this.total,
      this.vat,
      this.grandTotal,
      // this.deliveryMethod,
      this.address,
      this.items});

  DataCartModel.fromJson(Map<String, dynamic> json) {
    countItems = json['count_items'];
    countQty = json['count_qty'];
    discountTotal = json['discount_total'];
    discountRate = json['discount_rate'];
    deliveryPrice = json['delivery_price'];
    total = json['total'];
    if (json['vat'] != null) {
      vat = <Vat>[];
      json['vat'].forEach((v) {
        vat!.add(new Vat.fromJson(v));
      });
    }
    grandTotal = json['grand_total'];
    // deliveryMethod = json['delivery_method'];
    address = json['address'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }
}

class Vat {
  String? taxRate;
  String? taxTotal;

  Vat({this.taxRate, this.taxTotal});

  Vat.fromJson(Map<String, dynamic> json) {
    taxRate = json['tax_rate'];
    taxTotal = json['tax_total'];
  }
}

class Items {
  String? itemId;
  String? name;
  int? quantity;
  String? price;
  String? itemTotal;
  String? image;
  String? size;
  String? dough;
  String? spicy;
  List<DataItems>? dataItems;

  Items(
      {this.itemId,
      this.name,
      this.quantity,
      this.price,
      this.itemTotal,
      this.image,
      this.size,
      this.dough,
      this.spicy,
      this.dataItems});

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    itemTotal = json['item_total'];
    image = json['image'];
    size = json['size'];
    dough = json['dough'];
    spicy = json['spicy'];
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      dataItems = <DataItems>[];
      json['data'].forEach((v) {
        dataItems!.add(new DataItems.fromJson(v));
      });
    }
  }
}

class DataItems {
  String? name;
  String? image;
  List<String>? component;
  List<BasicComponent>? basicComponent;
  // List<Null> newComponent;
  // List<Null> delComponent;
  List<String>? entrees;
  Printer? printer;

  DataItems(
      {this.name,
      this.image,
      this.component,
      this.basicComponent,
      // this.newComponent,
      // this.delComponent,
      this.entrees,
      this.printer});

  DataItems.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    if (json['component'] != null) {
      component = <String>[];
      json['component'].forEach((v) {
        component!.add(v);
      });
    }
    if (json['basic_component'] != null) {
      basicComponent = <BasicComponent>[];
      json['basic_component'].forEach((v) {
        basicComponent!.add(new BasicComponent.fromJson(v));
      });
    }
    // if (json['new_component'] != null) {
    //   newComponent = new List<Null>();
    //   json['new_component'].forEach((v) {
    //     newComponent.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['del_component'] != null) {
    //   delComponent = new List<Null>();
    //   json['del_component'].forEach((v) {
    //     delComponent.add(new Null.fromJson(v));
    //   });
    // }
    entrees = json['entrees'].cast<String>();
    printer =
        json['printer'] != null ? new Printer.fromJson(json['printer']) : null;
  }
}

class BasicComponent {
  String? name;
  int? extra;

  BasicComponent({this.name, this.extra});

  BasicComponent.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    extra = json['extra'];
  }
}

class Printer {
  int? id;
  String? name;

  Printer({this.id, this.name});

  Printer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Entrees {
  int? id;
  String? name;
  int? isEntrees;
  String? icon;
  List<DataEntrees>? dataEntrees;

  Entrees({this.id, this.name, this.isEntrees, this.icon, this.dataEntrees});

  Entrees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isEntrees = json['is_entrees'];
    icon = json['icon'];
    if (json['data'] != null) {
      dataEntrees = <DataEntrees>[];
      json['data'].forEach((v) {
        dataEntrees!.add(new DataEntrees.fromJson(v));
      });
    }
  }
}

class DataEntrees {
  int? id;
  String? name;
  String? price;
  String? desc;
  String? note;
  String? image;

  DataEntrees(
      {this.id, this.name, this.desc, this.note, this.image, this.price});

  DataEntrees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    note = json['note'];
    image = json['image'];
    price = json['price'];
  }
}
