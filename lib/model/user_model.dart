class UserModel {
  int? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  UserData? userData;

  Data({this.token, this.userData});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? login;
  String? email;
  String? permissions;
  bool? isActivated;
  int? roleId;
  Null activatedAt;
  String? lastLogin;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  int? isSuperuser;

  UserData(
      {this.id,
      this.firstName,
      this.lastName,
      this.login,
      this.email,
      this.permissions,
      this.isActivated,
      this.roleId,
      this.activatedAt,
      this.lastLogin,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.isSuperuser});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    login = json['login'];
    email = json['email'];
    permissions = json['permissions'];
    isActivated = json['is_activated'];
    roleId = json['role_id'];
    activatedAt = json['activated_at'];
    lastLogin = json['last_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isSuperuser = json['is_superuser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['login'] = this.login;
    data['email'] = this.email;
    data['permissions'] = this.permissions;
    data['is_activated'] = this.isActivated;
    data['role_id'] = this.roleId;
    data['activated_at'] = this.activatedAt;
    data['last_login'] = this.lastLogin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['is_superuser'] = this.isSuperuser;
    return data;
  }
}
