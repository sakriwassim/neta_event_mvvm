import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';

import '../../../core/widgets/medium_button.dart';
import '../models_events/add_event_model.dart';
import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';
import '../view_model_events/one_event_view_model.dart';

class UpdateUserView extends StatefulWidget {
  final OneUserViewModel eventObj;
  UpdateUserView({super.key, required this.eventObj});

  @override
  State<UpdateUserView> createState() => _UpdateUserViewState();
}

class _UpdateUserViewState extends State<UpdateUserView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late String prixfield;
  late String descriptionfield;

  late String Libellefield;
  late String Prixfield;
  late String Descriptionfield;

  var data = UsersViewModel(eventsRepository: UsersApi());

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
                    var event = {
                      // "id": widget.eventObj.id,
                      // "category_id": "1",
                      // "observation_id": "21",
                      // "libelle": libellefield.toString(),
                      // "description": descriptionfield.toString(),
                      // "prix": prixfield.toString(),
                      // "date_heure": "2020-01-27 17:50:45",
                      // "adresse": "Stade du 26 Mars",
                      // "nbre_tichet": "1000",
                      // "status": "statut",
                      "image": "image8888888888888888888",
                      "created_at": "2022-09-30T15:11:08.000000Z",
                      "updated_at": "2022-09-30T15:11:08.000000Z"
                    };

                    AddUserModel eventformJson = AddUserModel.fromJson(event);
                    //   print(eventformJson);

                    setState(() {
                      data.UpdateUserByID(eventformJson);
                    });
                  }
                },
                child: MediumButton(text: "MODIFIER"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
