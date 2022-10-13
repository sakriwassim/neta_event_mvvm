import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/widgets/Medium_button_style%20copy.dart';

import '../models_packs/pack_model.dart';
import '../packs_repositories/packs_api.dart';
import '../view_model_packs/packs_view_model.dart';
import '../view_model_packs/one_pack_view_model.dart';

class UpdatePackView extends StatefulWidget {
  final OnePackViewModel eventObj;
  UpdatePackView({super.key, required this.eventObj});

  @override
  State<UpdatePackView> createState() => _UpdatePackViewState();
}

class _UpdatePackViewState extends State<UpdatePackView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late String prixfield;
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
                      "id": 4,
                      "libelle": libellefield.toString(),
                      "created_at": "2022-10-12T22:02:41.000000Z",
                      "updated_at": "2022-10-12T22:02:41.000000Z"
                    };

                    PackModel eventformJson = PackModel.fromJson(event);
                    print(eventformJson);

                    setState(() {
                      data.UpdatePackByID(eventformJson);
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
