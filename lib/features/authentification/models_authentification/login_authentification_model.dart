class AuthentificationModel {
  int? role_id;
  int? packs_id;
  String? nom_complet;
  String? email;
  int? telephone;
  String? adresse;
  String? image;
  String? password;

  AuthentificationModel(
      {this.role_id,
      this.packs_id,
      this.nom_complet,
      this.email,
      this.telephone,
      this.adresse,
      this.image});

  AuthentificationModel.fromJson(Map<String, dynamic> json) {
    role_id = json['role_id'];
    packs_id = json['packs_id'];
    nom_complet = json['nom_complet'];
    email = json['email'];
    telephone = json['telephone'];
    adresse = json['adresse'];
    image = json['image'];
  }

  Map<String, dynamic> toJSON() {
    return {
      "role_id": role_id,
      "packs_id": packs_id,
      "nom_complet": nom_complet,
      "email": email,
      "telephone": telephone,
      "adresse": adresse,
      "image": image,
      "password": password
    };
  }
}
