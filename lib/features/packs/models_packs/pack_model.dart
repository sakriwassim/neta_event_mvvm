import '../../users/models_users/event_by_id_model.dart';

class PackModel {

   int? id;
   String? dateExpire;
   String? libelle;
   String? montant;
   int? nbreEvents;
   int? nbreJrPubs;
   int? typePackId;
   int? userId;
   String? createdAt;
   String? updatedAt;
   UserModelById? user;
   TypePack? typePack;

    PackModel({
     this.id,
     this.dateExpire,
     this.libelle,
     this.montant,
     this.nbreEvents,
     this.nbreJrPubs,
     this.typePackId,
     this.userId,
     this.createdAt,
     this.updatedAt,
     this.user,
     this.typePack,
  });
  
  PackModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    dateExpire = json['date_expire'];
    libelle = json['libelle'];
    montant = json['montant'];
    nbreEvents = json['nbre_events'];
    nbreJrPubs = json['nbre_jr_pubs'];
    typePackId = json['type_pack_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = UserModelById.fromJson(json['user']);
    typePack = TypePack.fromJson(json['type_pack']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['date_expire'] = dateExpire;
    _data['libelle'] = libelle;
    _data['montant'] = montant;
    _data['nbre_events'] = nbreEvents;
    _data['nbre_jr_pubs'] = nbreJrPubs;
    _data['type_pack_id'] = typePackId;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['user'] = user?.toJson();
    _data['type_pack'] = typePack?.toJson();
    return _data;
  }
}


class TypePack {
  
   int? id;
   String? libelle;
   String? createdAt;
   String? updatedAt;

   TypePack({
     this.id,
     this.libelle,
     this.createdAt,
     this.updatedAt,
  });
  
  TypePack.fromJson(Map<String, dynamic> json){
    id = json['id'];
    libelle = json['libelle'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['libelle'] = libelle;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}