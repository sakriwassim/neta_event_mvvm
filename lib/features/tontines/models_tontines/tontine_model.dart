import 'package:neta_event_mvvm/features/users/models_users/event_by_id_model.dart';

class TontineModel {
  TontineModel({
     this.id,
     this.libelle,
     this.periode,
     this.nbrParticipant,
     this.montantRegulier,
     this.statut,
     this.image,
     this.userId,
     this.categorieTontineId,
     this.createdAt,
     this.updatedAt,
     this.user,
     this.categorieTontine,
  });
   int? id;
   String? libelle;
   String? periode;
   int? nbrParticipant;
   int? montantRegulier;
   String? statut;
   String? image;
   int? userId;
   int? categorieTontineId;
   String? createdAt;
   String? updatedAt;
   UserModelById? user;
   CategorieTontine? categorieTontine;
  
  TontineModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    libelle = json['libelle'];
    periode = json['periode'];
    nbrParticipant = json['nbr_participant'];
    montantRegulier = json['montant_regulier'];
    statut = json['statut'];
    image = json['image'];
    userId = json['user_id'];
    categorieTontineId = json['categorie_tontine_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = UserModelById.fromJson(json['user']);
    categorieTontine = CategorieTontine.fromJson(json['categorie_tontine']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['libelle'] = libelle;
    _data['periode'] = periode;
    _data['nbr_participant'] = nbrParticipant;
    _data['montant_regulier'] = montantRegulier;
    _data['statut'] = statut;
    _data['image'] = image;
    _data['user_id'] = userId;
    _data['categorie_tontine_id'] = categorieTontineId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['user'] = user?.toJson();
    _data['categorie_tontine'] = categorieTontine?.toJson();
    return _data;
  }
}


class CategorieTontine {
  CategorieTontine({
     this.id,
     this.libelle,
     this.description,
     this.image,
     this.createdAt,
     this.updatedAt,
  });
   int? id;
   String? libelle;
   String? description;
   String? image;
   String? createdAt;
   String? updatedAt;
  
  CategorieTontine.fromJson(Map<String, dynamic> json){
    id = json['id'];
    libelle = json['libelle'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['libelle'] = libelle;
    _data['description'] = description;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}