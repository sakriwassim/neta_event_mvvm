class AddUserModel {
  int? roleId;
  int? packsId;
  String? nomComplet;
  String? email;
  int? telephone;
  String? adresse;
  String? image;
  String? password;

  AddUserModel(
      {this.roleId,
      this.packsId,
      this.nomComplet,
      this.email,
      this.telephone,
      this.adresse,
      this.image,
      this.password});

  AddUserModel.fromJson(Map<String, dynamic> json) {
    roleId = json['role_id'];
    packsId = json['packs_id'];
    nomComplet = json['nom_complet'];
    email = json['email'];
    telephone = json['telephone'];
    adresse = json['adresse'];
    image = json['image'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role_id'] = this.roleId;
    data['packs_id'] = this.packsId;
    data['nom_complet'] = this.nomComplet;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['adresse'] = this.adresse;
    data['image'] = this.image;
    data['password'] = this.password;
    return data;
  }
}