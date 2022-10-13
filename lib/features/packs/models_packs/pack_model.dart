class PackModel {
  int? id;
  String? libelle;
  String? created_at;
  String? updated_at;

  PackModel({this.id, this.libelle, this.created_at, this.updated_at});

  PackModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'libelle': libelle,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}
