class AddTontineModel {
  int? userId;
  int? categorieTontineId;
  String? libelle;
  String? periode;
  int? nbrParticipant;
  int? montantRegulier;
  String? status;
  String? image;

  AddTontineModel(
      {required this.userId,
      required this.categorieTontineId,
      required this.libelle,
      required this.periode,
      required this.nbrParticipant,
      required this.montantRegulier,
      required this.status,
      required this.image});

  AddTontineModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    categorieTontineId = json['categorie_tontine_id'];
    libelle = json['libelle'];
    periode = json['periode'];
    nbrParticipant = json['nbr_participant'];
    montantRegulier = json['montant_regulier'];
    status = json['status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['categorie_tontine_id'] = this.categorieTontineId;
    data['libelle'] = this.libelle;
    data['periode'] = this.periode;
    data['nbr_participant'] = this.nbrParticipant;
    data['montant_regulier'] = this.montantRegulier;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }
}
