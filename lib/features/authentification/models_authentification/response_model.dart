class AuthentificationResponseModel {
  AuthentificationResponseModel({
    required this.data,
    required this.status,
    required this.code,
    required this.message,
  });
  late final Data data;
  late final int status;
  late final int code;
  late final String message;

  AuthentificationResponseModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['status'] = status;
    _data['code'] = code;
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.token,
  });
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    return _data;
  }
}
