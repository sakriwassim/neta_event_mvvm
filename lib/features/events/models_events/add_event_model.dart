class AddEventModel {
  int? categoryId;
  int? observationId;
  String? libelle;
  String? description;
  int? prix;
  String? dateHeure;
  String? adresse;
  int? nbreTichet;
  String? status;
  String? image;

  AddEventModel(
      {this.categoryId,
      this.observationId,
      this.libelle,
      this.description,
      this.prix,
      this.dateHeure,
      this.adresse,
      this.nbreTichet,
      this.status,
      this.image});

  AddEventModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    observationId = json['observation_id'];
    libelle = json['libelle'];
    description = json['description'];
    prix = json['prix'];
    dateHeure = json['date_heure'];
    adresse = json['adresse'];
    nbreTichet = json['nbre_tichet'];
    status = json['status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['observation_id'] = this.observationId;
    data['libelle'] = this.libelle;
    data['description'] = this.description;
    data['prix'] = this.prix;
    data['date_heure'] = this.dateHeure;
    data['adresse'] = this.adresse;
    data['nbre_tichet'] = this.nbreTichet;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }
}
