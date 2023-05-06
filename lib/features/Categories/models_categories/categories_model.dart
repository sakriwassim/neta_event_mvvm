class CategorieModel {
  
  int? id;
  String? libelle;
  String? description;
  int? nbreEvents;
  int? montantTotal;
  String? image;
  String? createdAt;
  String? updatedAt;
  

  CategorieModel({
     this.id,
     this.libelle,
     this.description,
     this.nbreEvents,
     this.montantTotal,
     this.image,
     this.createdAt,
     this.updatedAt,
  });
  CategorieModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    libelle = json['libelle'];
    description = json['description'];
    nbreEvents = json['nbre_events'];
    montantTotal = json['montant_total'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['libelle'] = libelle;
    _data['description'] = description;
    _data['nbre_events'] = nbreEvents;
    _data['montant_total'] = montantTotal;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}