import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/int.dart';

import '../../../core/colors.dart';
import '../../../core/widgets/small_button_style.dart';
import '../models_categories/add_categories_model.dart';
import '../categories_repositories/categories_api.dart';
import '../view_model_categories/categories_view_model.dart';

class AddCategorieView extends StatefulWidget {
  const AddCategorieView({
    super.key,
  });

  @override
  State<AddCategorieView> createState() => _AddCategorieViewState();
}

class _AddCategorieViewState extends State<AddCategorieView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late String prixfield;
  late String descriptionfield;

  var data = CategoriesViewModel(ticketsRepository: CategoriesApi());

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
            "Add Categorie",
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
                  prixfield = text;
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
                  descriptionfield = text;
                },
              ),
            ),
            InkWell(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    var ticket = {
                      "nbre_events": 1,
                      "libelle": libellefield,
                      "description": "description",
                      "montant_total": "25000",
                      "image": "https://lienDeLimage"
                    };

                    AddCategorieModel ticketformJson =
                        AddCategorieModel.fromJson(ticket);
                    // print(ticketformJson);

                    setState(() {
                      data.AddCategorie(ticketformJson);
                    });
                  }
                },
                child: Button(
                  text: "APPLIQUER",
                  fontSize: fontSizemediumbutton,
                  gradientbackground: gradientbackground,
                  height: heightmediumbutton,
                  width: widthmediumbutton,
                )),
          ],
        ),
      ),
    );
  }
}
