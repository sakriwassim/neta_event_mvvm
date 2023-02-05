class TontineModel {
  int? id;
  String? user_id;
  String? libelle;
  String? periode;
  String? nbr_participant;
  String? montant_regulier;

  String? status;
  String? image;
  String? created_at;
  String? updated_at;

  TontineModel(
      {this.id,
      this.user_id,
      this.libelle,
      this.periode,
      this.nbr_participant,
      this.montant_regulier,
      this.status,
      this.image,
      this.created_at,
      this.updated_at});

  TontineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    libelle = json['libelle'];
    periode = json['periode'];
    nbr_participant = json['nbr_participant'];
    montant_regulier = json['montant_regulier'];
    status = json['status'];
    image = json['image'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "user_id": user_id,
      "libelle": libelle,
      "periode": periode,
      "nbr_participant": nbr_participant,
      "montant_regulier": montant_regulier,
      "status": status,
      "image": image,
      "created_at": created_at,
      "updated_at": updated_at
    };
  }
}
