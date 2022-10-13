// class AddTicketModel {
//   int? event_id;
//   String? libelle;
//   String? description;
//   String? prix;
//   String? QR_code;
//   String? date;
//   String? statut;

//   AddTicketModel(
//       {this.event_id,
//       this.libelle,
//       this.description,
//       this.prix,
//       this.QR_code,
//       this.date,
//       this.statut});

//   AddTicketModel.fromJson(Map<String, dynamic> json) {
//     event_id = json['event_id'];
//     libelle = json['libelle'];
//     description = json['description'];
//     prix = json['prix'];
//     QR_code = json['QR_code'];
//     date = json['date'];
//     statut = json['statut'];
//   }

//   Map<String, dynamic> toJSON() {
//     return {
//       "event_id": event_id,
//       "libelle": libelle,
//       "description": description,
//       "prix": prix,
//       "QR_code": QR_code,
//       "date": date,
//       "statut": statut
//     };
//   }
// }
