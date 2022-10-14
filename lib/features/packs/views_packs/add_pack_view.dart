import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';

import '../../../core/widgets/medium_button.dart';
import '../models_packs/pack_model.dart';
import '../packs_repositories/packs_api.dart';
import '../view_model_packs/packs_view_model.dart';

class AddPackView extends StatefulWidget {
  AddPackView({
    super.key,
  });

  @override
  State<AddPackView> createState() => _AddPackViewState();
}

class _AddPackViewState extends State<AddPackView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late int prixfield;
  late String descriptionfield;

  var data = PacksViewModel(packsRepository: PacksApi());

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
            "Add pack",
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
                  prixfield = 7;
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
              child: InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      var event = {
                        "libelle": libellefield,
                        "updated_at": "2022-10-12T21:42:29.000000Z",
                        "created_at": "2022-10-12T21:42:29.000000Z",
                        "id": 3
                      };

                      PackModel eventformJson = PackModel.fromJson(event);
                      print(eventformJson);

                      setState(() {
                        data.AddPack(eventformJson);
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
