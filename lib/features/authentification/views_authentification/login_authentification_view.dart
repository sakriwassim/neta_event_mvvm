import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';

import '../../../home_page.dart';
import '../../../home_view.dart';
import '../../events/evants_repositories/events_api.dart';
import '../authentification_repositories/authentification_api.dart';
import '../models_authentification/login_authentification_model.dart';
import '../view_model_authentification/authentification_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formkey = GlobalKey<FormState>();
  late String nomcompletfield;
  late String emailfield;
  late String passwordfield;

  var data = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Form(
        key: formkey,
        child: Column(
          children: [
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
                  labelText: 'email',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                  ),
                  hintText: 'entre le email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "entre le email";
                  } else {
                    // prixfield = widget.eventObj.prix;
                    return null;
                  }
                },
                onChanged: (text) {
                  emailfield = text;
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
                  labelText: ' password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                  ),
                  hintText: 'entre le password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "entre le password";
                  } else {
                    //dateMesurefield = datenow.toString();
                    //descriptionfield = widget.eventObj.description.toString();
                    return null;
                  }
                },
                onChanged: (text) {
                  passwordfield = text;
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    var event = {
                      "role_id": 1,
                      "packs_id": 1,
                      "nom_complet": "Mousa Keita",
                      "email": emailfield.toString(),
                      "telephone": 70213645,
                      "adresse": "Faladiè",
                      "image": "https://cheminverslimage",
                      "password": passwordfield.toString()
                    };

                    AuthentificationModel authentificationModel =
                        AuthentificationModel.fromJson(event);

                    bool verif = await data.Login(authentificationModel);
                    if (verif == true) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ));
                    }
                  }
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
