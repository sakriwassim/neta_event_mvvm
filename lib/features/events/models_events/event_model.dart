import '../../Categories/models_categories/categories_model.dart';
import '../../tickets/models_tickets/ticket_model.dart';

class EventModel {

  int? id;
  String? libelle;
  String? description;
  int? prix;
  String? dateHeure;
  String? adresse;
  int? nbreTichet;
  String? statut;
  String? image;
  int? categorieId;
  int? observationId;
  String? createdAt;
  String? updatedAt;
  List<TicketModel?>? ticket;
  CategorieModel? categorie;
  Observation? observation;

    EventModel({
     this.id,
     this.libelle,
     this.description,
     this.prix,
     this.dateHeure,
     this.adresse,
     this.nbreTichet,
     this.statut,
     this.image,
     this.categorieId,
     this.observationId,
     this.createdAt,
     this.updatedAt,
     this.ticket,
     this.categorie,
     this.observation,
  });
  
  EventModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    libelle = json['libelle'];
    description = json['description'];
    prix = json['prix'];
    dateHeure = json['date_heure'];
    adresse = json['adresse'];
    nbreTichet = json['nbre_tichet'];
    statut = json['statut'];
    image = json['image'];
    categorieId = json['categorie_id'];
    observationId = json['observation_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ticket = List.from(json['ticket']).map((e)=>TicketModel.fromJson(e)).toList();
    categorie = CategorieModel.fromJson(json['categorie']);
    observation = Observation.fromJson(json['observation']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['libelle'] = libelle;
    _data['description'] = description;
    _data['prix'] = prix;
    _data['date_heure'] = dateHeure;
    _data['adresse'] = adresse;
    _data['nbre_tichet'] = nbreTichet;
    _data['statut'] = statut;
    _data['image'] = image;
    _data['categorie_id'] = categorieId;
    _data['observation_id'] = observationId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['ticket'] = ticket?.map((e)=>e?.toJson()).toList();
    _data['categorie'] = categorie?.toJson();
    _data['observation'] = observation?.toJson();
    return _data;
  }
}




class Observation {

  int? id;
  String? libelle;
  int? nbreEtoile;
  int? userId;
  String? createdAt;
  String? updatedAt;

    Observation({
     this.id,
     this.libelle,
     this.nbreEtoile,
     this.userId,
     this.createdAt,
     this.updatedAt,
  });
  
  Observation.fromJson(Map<String, dynamic> json){
    id = json['id'];
    libelle = json['libelle'];
    nbreEtoile = json['nbre_etoile'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['libelle'] = libelle;
    _data['nbre_etoile'] = nbreEtoile;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}