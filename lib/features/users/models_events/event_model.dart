class UserModel {
  int? id;
  String? roleId;
  String? packsId;
  String? nomComplet;
  String? telephone;
  String? adresse;
  String? image;
  String? email;
  bool? emailVerifiedAt;
  String? password;
  bool? rememberToken;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.roleId,
      this.packsId,
      this.nomComplet,
      this.telephone,
      this.adresse,
      this.image,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    packsId = json['packs_id'];
    nomComplet = json['nom_complet'];
    telephone = json['telephone'];
    adresse = json['adresse'];
    image = json['image'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['packs_id'] = this.packsId;
    data['nom_complet'] = this.nomComplet;
    data['telephone'] = this.telephone;
    data['adresse'] = this.adresse;
    data['image'] = this.image;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
