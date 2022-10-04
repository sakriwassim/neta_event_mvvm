import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/view_model/one_event_view_model.dart';

import '../../models/add_event_model.dart';
import '../../models/event_model.dart';
import '../../repositories/evants_repositories/events_api.dart';
import '../../view_model/events_view_model.dart';

class AddEventView extends StatefulWidget {
  //final OneEventViewModel eventObj;
  AddEventView({
    super.key,
  });

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late int prixfield;
  late String descriptionfield;

  late String Libellefield;
  late String Prixfield;
  late String Descriptionfield;

  var data = EventsViewModel(eventsRepository: EventsApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Screen")),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                // controller: TextEditingController(
                //   text: widget.eventObj.libelle,
                //  ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF2F2F2),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Color(0xFFFF8000)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  labelText: 'date de mesure',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                  ),
                  hintText: 'entre le date de mesure',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "entre le date de mesure";
                  } else {
                    // libellefield = widget.eventObj.libelle;
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
                //controller: TextEditingController(text: widget.eventObj.prix),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF2F2F2),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Color(0xFFFF8000)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  labelText: 'date de mesure',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                  ),
                  hintText: 'entre le date de mesure',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "entre le date de mesure";
                  } else {
                    // prixfield = widget.eventObj.prix;
                    return null;
                  }
                },
                onChanged: (text) {
                  prixfield = 7;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                //    controller:
                //      TextEditingController(text: widget.eventObj.description),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF2F2F2),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Color(0xFFFF8000)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  labelText: 'date de mesure',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                  ),
                  hintText: 'entre le date de mesure',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "entre le date de mesure";
                  } else {
                    //dateMesurefield = datenow.toString();
                    //descriptionfield = widget.eventObj.description.toString();
                    return null;
                  }
                },
                onChanged: (text) {
                  descriptionfield = text;
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    var event = {
                      "category_id": 1,
                      "observation_id": 21,
                      "libelle": libellefield,
                      "description": descriptionfield,
                      "prix": prixfield,
                      "date_heure": "2020-01-27 17:50:45",
                      "adresse": "Stade du 26 Mars",
                      "nbre_tichet": 1000,
                      "status": "statut",
                      "image": "image"
                    };

                    AddEventModel eventformJson = AddEventModel.fromJson(event);
                    print(eventformJson);
                    // data.AddEventByID(eventformJson);
                    data.AddEvent(eventformJson);
                  }
                },
                child: Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
