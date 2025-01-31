
class LoginModelResponse {
  Data? data;
  bool? success;
  int? code;

  LoginModelResponse({this.data, this.success, this.code});

  LoginModelResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? id;
  String? email;
  String? name;
  String? role;
  String? accessToken;
  String? refreshToken;

  Data(
      {this.id,
        this.email,
        this.name,
        this.role,
        this.accessToken,
        this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    role = json['role'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['role'] = this.role;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}