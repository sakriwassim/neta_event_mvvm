class TicketModel {
  int? id;
  String? eventid;
  String? iduser;
  String? libelle;
  String? description;
  String? prix;
  String? qRcode;
  String? date;
  String? dateexpire;
  String? statut;
  DateTime? createdat;
  DateTime? updatedat;

  TicketModel(
      {this.id,
      this.eventid,
      this.iduser,
      this.libelle,
      this.description,
      this.prix,
      this.qRcode,
      this.date,
      this.dateexpire,
      this.statut,
      this.createdat,
      this.updatedat});

  TicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventid = json['event_id'];
    iduser = json['id_user'];
    libelle = json['libelle'];
    description = json['description'];
    prix = json['prix'];
    qRcode = json['QR_code'];
    date = json['date'];
    dateexpire = json['date_expire'];
    statut = json['statut'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['event_id'] = eventid;
    data['id_user'] = iduser;
    data['libelle'] = libelle;
    data['description'] = description;
    data['prix'] = prix;
    data['QR_code'] = qRcode;
    data['date'] = date;
    data['date_expire'] = dateexpire;
    data['statut'] = statut;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}
