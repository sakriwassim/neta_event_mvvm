import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/widgets/small_button_style.dart';
import '../models_packs/pack_model.dart';
import '../view_model_packs/packs_view_model.dart';

class AddPackView extends StatefulWidget {

  const AddPackView ({Key? key}) : super(key: key);

  @override
  State<AddPackView> createState() => _AddPackViewState();
}

class _AddPackViewState extends State<AddPackView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late int prixfield;
  late String descriptionfield;

  var data = PacksViewModel();

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
            "Add pack",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              width: widthbigbutton,
              height: heightbigbutton,
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
            SizedBox(
              width: widthbigbutton,
              height: heightbigbutton,
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
            SizedBox(
              width: widthbigbutton,
              height: heightbigbutton,
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
            InkWell(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    var event = {
                      "id": 1,
                      "type_pack_id": "8",
                      "libelle": libellefield,
                      "montant": "Description du pack",
                      "nbre_events": "1500",
                      "nbre_jr_pubs": "21",
                      "created_at": "2022-10-11T11:51:57.000000Z",
                      "updated_at": "2022-10-11T11:51:57.000000Z"
                    };

                    PackModel eventformJson = PackModel.fromJson(event);
                    //print(eventformJson);

                    setState(() {
                      data.AddPack(eventformJson);
                    });
                  }
                },
                child: Button(
                  text: "APPLIQUER",
                  fontSize: fontSizemediumbutton,
                  gradientbackground: gradientbackground,
                  height: heightmediumbutton,
                  width: widthmediumbutton,
                      fontWeight: FontWeight.normal, textcolor: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
