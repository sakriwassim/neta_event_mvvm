class TokenModel {
  String? iss;
  int? iat;
  int? exp;
  int? nbf;
  String? jti;
  int? sub;
  String? prv;
  int? userId;
  String? email;
  TokenModel? tokenModel;

  TokenModel(
      {required this.iss,
      required this.iat,
      required this.exp,
      required this.nbf,
      required this.jti,
      required this.sub,
      required this.prv,
      required this.userId,
      required this.email});

  TokenModel.fromJson(Map<String, dynamic> json) {
    iss = json['iss'];
    iat = json['iat'];
    exp = json['exp'];
    nbf = json['nbf'];
    jti = json['jti'];
    sub = json['sub'];
    prv = json['prv'];
    userId = json['user_id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iss'] = this.iss;
    data['iat'] = this.iat;
    data['exp'] = this.exp;
    data['nbf'] = this.nbf;
    data['jti'] = this.jti;
    data['sub'] = this.sub;
    data['prv'] = this.prv;
    data['user_id'] = this.userId;
    data['email'] = this.email;
    return data;
  }
}
