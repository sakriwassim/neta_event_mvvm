// import 'package:flutter/material.dart';
// import 'package:neta_event_mvvm/features/tontines/views_tontines/tontines_view.dart';

// import '../../../core/colors.dart';
// import '../../../core/decoration.dart';
// import '../../../core/int.dart';
// import '../../../core/widgets/small_button_style.dart';
// import '../../tontines/models_tontines/tontine_model.dart';
// import '../../tontines/view_model_tickets/tontines_view_model.dart';

// class UpdateNotificationView extends StatefulWidget {
//   final TontineModel ticketObj;
//   const UpdateNotificationView({super.key, required this.ticketObj});

//   @override
//   State<UpdateNotificationView> createState() => _UpdateNotificationViewState();
// }

// class _UpdateNotificationViewState extends State<UpdateNotificationView> {
//   final formkey = GlobalKey<FormState>();
//   late String libellefield;
//   late String prixfield;
//   late String descriptionfield;
//   var data = TontinesViewModel();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           iconTheme: const IconThemeData(
//             color: Colors.black,
//           ),
//           shadowColor: Colors.white,
//           elevation: 0.0,
//           backgroundColor: Colors.white,
//           title: const Text(
//             "MODIFIER",
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           )),
//       body: Form(
//         key: formkey,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: TextFormField(
//                 decoration: textFieldDecoration(
//                   "Mot de passe",
//                   "entre le password",
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "entre le date de mesure";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onChanged: (text) {
//                   libellefield = text;
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: TextFormField(
//                 decoration: textFieldDecoration(
//                   "Mot de passe",
//                   "entre le password",
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "entre le date de mesure";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onChanged: (text) {
//                   prixfield = text;
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: TextFormField(
//                 decoration: textFieldDecoration(
//                   "Mot de passe",
//                   "entre le password",
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "entre le date de mesure";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onChanged: (text) {
//                   descriptionfield = text;
//                 },
//               ),
//             ),
//             InkWell(
//               onTap: () async {
//                 if (formkey.currentState!.validate()) {
//                   var ticket = {
//                     "id": widget.ticketObj.id,
//                     "user_id": "1",
//                     "libelle": libellefield,
//                     "periode": descriptionfield,
//                     "nbr_participant": prixfield,
//                     "montant_regulier": "1000",
//                     "status": "statut",
//                     "image": "htpps://LienDeLimage",
//                     "created_at": "2022-10-11T12:27:41.000000Z",
//                     "updated_at": "2022-10-11T12:27:41.000000Z"
//                   };

//                   TontineModel ticketformJson = TontineModel.fromJson(ticket);
//                   //  print(ticketformJson);

//                   var update = await data.UpdateTontineByID(ticketformJson);

//                   if (update == true) {
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const GetAllTontineView()));
//                   }
//                 }
//               },
//               child: Button(
//                 text: "MODIFIER",
//                 fontSize: fontSizemediumbutton,
//                 fontWeight: FontWeight.normal,
//                 gradientbackground: gradientbackground,
//                 height: heightmediumbutton,
//                 width: widthmediumbutton,
//                 textcolor: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
