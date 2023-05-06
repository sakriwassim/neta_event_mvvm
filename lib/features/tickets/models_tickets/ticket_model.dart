class TicketModel {
 
  int? id;
  String? libelle;
  String? description;
  int? prix;
  String? QRCode;
  String? dateDebut;
  String? dateExpire;
  String? statut;
  int? userId;
  int? eventsId;
  String? createdAt;
  String? updatedAt;
  

 TicketModel({
     this.id,
     this.libelle,
     this.description,
     this.prix,
     this.QRCode,
     this.dateDebut,
     this.dateExpire,
     this.statut,
     this.userId,
     this.eventsId,
     this.createdAt,
     this.updatedAt,
  });

  TicketModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    libelle = json['libelle'];
    description = json['description'];
    prix = json['prix'];
    QRCode = json['QR_code'];
    dateDebut = json['date_debut'];
    dateExpire = json['date_expire'];
    statut = json['statut'];
    userId = json['user_id'];
    eventsId = json['events_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['libelle'] = libelle;
    _data['description'] = description;
    _data['prix'] = prix;
    _data['QR_code'] = QRCode;
    _data['date_debut'] = dateDebut;
    _data['date_expire'] = dateExpire;
    _data['statut'] = statut;
    _data['user_id'] = userId;
    _data['events_id'] = eventsId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
