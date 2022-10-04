class EventModel {
  int? id;
  int? categoryId;
  String? observationId;
  String? libelle;
  String? description;
  int? prix;
  String? dateHeure;
  String? adresse;
  int? nbreTichet;
  String? status;
  String? image;
  String? createdAt;
  String? updatedAt;

  EventModel(
      {this.id,
      this.categoryId,
      this.observationId,
      this.libelle,
      this.description,
      this.prix,
      this.dateHeure,
      this.adresse,
      this.nbreTichet,
      this.status,
      this.image,
      this.createdAt,
      this.updatedAt});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'category_id': categoryId,
      'observation_id': observationId,
      'libelle': libelle,
      'description': description,
      'prix': prix,
      'date_heure': dateHeure,
      'adresse': adresse,
      'nbre_tichet': nbreTichet,
      'status': status,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt
    };
  }
}
