class UserModelById {
  int? id;
  String? nomComplet;
  int? telephone;
  String? adresse;
  String? statut;
  String? image;
  String? email;
  String? emailVerifiedAt;
  String? password;
  int? roleId;
  bool? rememberToken;
  String? createdAt;
  String? updatedAt;

  UserModelById(
      {this.id,
      this.nomComplet,
      this.telephone,
      this.adresse,
      this.statut,
      this.image,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.roleId,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  UserModelById.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomComplet = json['nom_complet'];
    telephone = json['telephone'];
    adresse = json['adresse'];
    statut = json['statut'];
    image = json['image'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    roleId = json['role_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom_complet'] = this.nomComplet;
    data['telephone'] = this.telephone;
    data['adresse'] = this.adresse;
    data['statut'] = this.statut;
    data['image'] = this.image;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['role_id'] = this.roleId;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}