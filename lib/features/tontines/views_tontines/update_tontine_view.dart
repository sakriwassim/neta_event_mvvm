import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/tontines/views_tontines/tontines_view.dart';

import '../../../core/colors.dart';
import '../../../core/decoration.dart';
import '../../../core/int.dart';
import '../../../core/widgets/small_button_style.dart';
import '../models_tontines/tontine_model.dart';
import '../view_model_tickets/tontines_view_model.dart';

class UpdateTontineView extends StatefulWidget {
  final TontineModel ticketObj;
  const UpdateTontineView({super.key, required this.ticketObj});

  @override
  State<UpdateTontineView> createState() => _UpdateTontineViewState();
}

class _UpdateTontineViewState extends State<UpdateTontineView> {
  final formkey = GlobalKey<FormState>();
  var data = TontinesViewModel();

  final libellefield = TextEditingController();
  final prixfield = TextEditingController();
  final descriptionfield = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            "MODIFIER",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: libellefield,
                decoration: textFieldDecoration(
                  "Mot de passe",
                  "entre le password",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "entre le date de mesure";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                decoration: textFieldDecoration(
                  "Mot de passe",
                  "entre le password",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "entre le date de mesure";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                decoration: textFieldDecoration(
                  "Mot de passe",
                  "entre le password",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "entre le date de mesure";
                  }
                },
              ),
            ),
            InkWell(
              onTap: () async {
                if (formkey.currentState!.validate()) {
                  var ticket = {
                    "id": widget.ticketObj.id,
                    "user_id": "1",
                    "libelle": libellefield,
                    "periode": descriptionfield,
                    "nbr_participant": prixfield,
                    "montant_regulier": "1000",
                    "status": "statut",
                    "image": "htpps://LienDeLimage",
                    "created_at": "2022-10-11T12:27:41.000000Z",
                    "updated_at": "2022-10-11T12:27:41.000000Z"
                  };

                  TontineModel ticketformJson = TontineModel.fromJson(ticket);

                  // var update = await data.UpdateTontineByID(ticketformJson);

                  // if (update == true) {
                  //   Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const GetAllTontineView()));
                  // }
                }
              },
              child: Button(
                text: "MODIFIER",
                fontSize: fontSizemediumbutton,
                fontWeight: FontWeight.normal,
                gradientbackground: gradientbackground,
                height: heightmediumbutton,
                width: widthmediumbutton,
                textcolor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
