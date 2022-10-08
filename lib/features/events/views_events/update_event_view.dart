import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/widgets/Medium_button_style%20copy.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';

import '../models_events/event_model.dart';
import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';

class UpdateEventView extends StatefulWidget {
  final OneEventViewModel eventObj;
  UpdateEventView({super.key, required this.eventObj});

  @override
  State<UpdateEventView> createState() => _UpdateEventViewState();
}

class _UpdateEventViewState extends State<UpdateEventView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late String prixfield;
  late String descriptionfield;

  late String Libellefield;
  late String Prixfield;
  late String Descriptionfield;

  var data = EventsViewModel(eventsRepository: EventsApi());

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
                      "id": widget.eventObj.id,
                      "category_id": "1",
                      "observation_id": "21",
                      "libelle": libellefield.toString(),
                      "description": descriptionfield.toString(),
                      "prix": prixfield.toString(),
                      "date_heure": "2020-01-27 17:50:45",
                      "adresse": "Stade du 26 Mars",
                      "nbre_tichet": "1000",
                      "status": "statut",
                      "image": "image8888888888888888888",
                      "created_at": "2022-09-30T15:11:08.000000Z",
                      "updated_at": "2022-09-30T15:11:08.000000Z"
                    };

                    EventModel eventformJson = EventModel.fromJson(event);
                    print(eventformJson);

                    setState(() {
                      data.UpdateEventByID(eventformJson);
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
