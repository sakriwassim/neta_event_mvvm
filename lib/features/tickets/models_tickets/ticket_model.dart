class TicketModel {
  int? id;
  String? event_id;
  String? libelle;
  String? description;
  String? prix;
  String? Qr_code;
  String? date;
  String? date_expire;
  String? statut;
  String? created_at;
  String? updated_at;

  TicketModel(
      {this.id,
      this.event_id,
      this.libelle,
      this.description,
      this.prix,
      this.Qr_code,
      this.date,
      this.date_expire,
      this.statut,
      this.created_at,
      this.updated_at});

  TicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    event_id = json['event_id'];
    libelle = json['libelle'];
    description = json['description'];
    prix = json['prix'];
    Qr_code = json['qr_code'];
    date = json['date'];
    date_expire = json['date_expire'];
    statut = json['statut'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "event_id": event_id,
      "libelle": libelle,
      "description": description,
      "prix": prix,
      "Qr_code": Qr_code,
      "date": date,
      "date_expire": date_expire,
      "statut": statut,
      "created_at": created_at,
      "updated_at": updated_at
    };
  }
}
