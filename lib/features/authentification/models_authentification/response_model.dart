class AuthentificationResponseModel {
  Data? data;
  int? status;
  int? code;
  String? message;

  AuthentificationResponseModel(
      {this.data, this.status, this.code, this.message});

  AuthentificationResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? token;

  Data({this.token});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
