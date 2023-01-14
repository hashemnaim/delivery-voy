class HomeServiceModel {
  int? status;
  String? msg;
  List<DataHomeServiceModel>? data;

  HomeServiceModel({this.status, this.msg, this.data});

  HomeServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DataHomeServiceModel>[];
      json['data'].forEach((v) {
        data!.add(new DataHomeServiceModel.fromJson(v));
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

class DataHomeServiceModel {
  int? id;
  String? note;
  String? status;
  int? statusId;
  String? createdAt;
  String? arrivalDate;
  int? total;
  List<Periods>? periods;

  DataHomeServiceModel(
      {this.id,
      this.note,
      this.status,
      this.statusId,
      this.createdAt,
      this.arrivalDate,
      this.total,
      this.periods});

  DataHomeServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    status = json['status'];
    statusId = json['status_id'];
    createdAt = json['created_at'];
    arrivalDate = json['arrival_date'];
    total = json['total'];
    if (json['periods'] != null) {
      periods = <Periods>[];
      json['periods'].forEach((v) {
        periods!.add(new Periods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['note'] = this.note;
    data['status'] = this.status;
    data['status_id'] = this.statusId;
    data['created_at'] = this.createdAt;
    data['arrival_date'] = this.arrivalDate;
    data['total'] = this.total;
    if (this.periods != null) {
      data['periods'] = this.periods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Periods {
  String? period;

  Periods({this.period});

  Periods.fromJson(Map<String, dynamic> json) {
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['period'] = this.period;
    return data;
  }
}
