import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/widgets/Medium_button_style%20copy.dart';

import '../models_tontines/add_tontine_model.dart';
import '../models_tontines/tontine_model.dart';
import '../tontines_repositories/tontines_api.dart';
import '../view_model_tickets/tontines_view_model.dart';

class AddTontineView extends StatefulWidget {
  AddTontineView({
    super.key,
  });

  @override
  State<AddTontineView> createState() => _AddTontineViewState();
}

class _AddTontineViewState extends State<AddTontineView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late String prixfield;
  late String descriptionfield;

  var data = TontinesViewModel(ticketsRepository: TontinesApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "Add Tontine",
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
                decoration: textFieldDecoration(
                  "Mot de passe",
                  "entre le password",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "entre le date de mesure";
                  } else {
                    return null;
                  }
                },
                onChanged: (text) {
                  libellefield = text;
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
                  } else {
                    return null;
                  }
                },
                onChanged: (text) {
                  prixfield = text;
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
                  } else {
                    return null;
                  }
                },
                onChanged: (text) {
                  descriptionfield = text;
                },
              ),
            ),
            Container(
              child: InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      var ticket = {
                        "id": 1,
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

                      TontineModel ticketformJson =
                          TontineModel.fromJson(ticket);
                      print(ticketformJson);

                      setState(() {
                        data.AddTontine(ticketformJson);
                      });
                    }
                  },
                  child: MediumButton(text: "APPLIQUER")),
            ),
          ],
        ),
      ),
    );
  }
}
