class PackModel {
  int? id;
  String? type_pack_id;
  String? libelle;
  String? montant;
  String? nbre_events;
  String? nbre_jr_pubs;
  String? created_at;
  String? updated_at;

  PackModel({this.id, this.libelle, this.created_at, this.updated_at});

  PackModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type_pack_id = json['type_pack_id'];
    libelle = json['libelle'];
    montant = json['montant'];
    nbre_events = json['nbre_events'];
    nbre_jr_pubs = json['nbre_jr_pubs'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "type_pack_id": type_pack_id,
      "libelle": libelle,
      "montant": montant,
      "nbre_events": nbre_events,
      "nbre_jr_pubs": nbre_jr_pubs,
      "created_at": created_at,
      "updated_at": updated_at
    };
  }
}