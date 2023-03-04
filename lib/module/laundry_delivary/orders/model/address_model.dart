class Address {
  String? id;
  String? areaId;
  String? areaName;
  String? cityName;
  String? type;
  String? lat;
  String? lng;
  String? address;
  String? flat;
  String? floor;
  String? building;

  Address(
      {this.id,
      this.areaId,
      this.areaName,
      this.cityName,
      this.type,
      this.lat,
      this.lng,
      this.address,
      this.flat,
      this.floor,
      this.building});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    areaId = json['area_id'].toString();
    areaName = json['area_name'];
    cityName = json['city_name'];
    type = json['type'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    flat = json['flat'];
    floor = json['floor'];
    building = json['building'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['area_id'] = this.areaId;
    data['area_name'] = this.areaName;
    data['city_name'] = this.cityName;
    data['type'] = this.type;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    data['flat'] = this.flat;
    data['floor'] = this.floor;
    data['building'] = this.building;
    return data;
  }
}
