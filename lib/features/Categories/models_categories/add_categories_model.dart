class AddCategorieModel {
  int? nbre_events;
  String? libelle;
  String? description;
  String? montant_total;
  String? image;

  AddCategorieModel(
      {this.nbre_events,
      this.libelle,
      this.description,
      this.montant_total,
      this.image});

  AddCategorieModel.fromJson(Map<String, dynamic> json) {
    nbre_events = json['nbre_events'];
    libelle = json['libelle'];
    description = json['description'];
    montant_total = json['montant_total'];
    image = json['image'];
  }

  Map<String, dynamic> toJSON() {
    return {
      "nbre_events": nbre_events,
      "libelle": libelle,
      "description": description,
      "montant_total": montant_total,
      "image": image
    };
  }
}
