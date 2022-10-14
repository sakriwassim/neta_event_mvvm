import 'package:flutter/material.dart';

import '../../../core/decoration.dart';
import '../../../core/widgets/medium_button.dart';
import '../models_categories/categories_model.dart';
import '../categories_repositories/categories_api.dart';
import '../view_model_categories/one_categorie_view_model.dart';
import '../view_model_categories/categories_view_model.dart';

class UpdateCategorieView extends StatefulWidget {
  final OneCategorieViewModel ticketObj;
  UpdateCategorieView({super.key, required this.ticketObj});

  @override
  State<UpdateCategorieView> createState() => _UpdateCategorieViewState();
}

class _UpdateCategorieViewState extends State<UpdateCategorieView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late String prixfield;
  late String descriptionfield;

  late String Libellefield;
  late String Prixfield;
  late String Descriptionfield;

  var data = CategoriesViewModel(ticketsRepository: CategoriesApi());

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
            InkWell(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  var ticket = {
                    "id": widget.ticketObj.id,
                    "type_pack_id": "8",
                    "libelle": libellefield,
                    "montant": "Description du pack",
                    "nbre_events": "1500",
                    "nbre_jr_pubs": "21",
                    "created_at": "2022-10-11T11:51:57.000000Z",
                    "updated_at": "2022-10-11T11:51:57.000000Z"
                  };

                  CategorieModel ticketformJson =
                      CategorieModel.fromJson(ticket);
                  print(ticketformJson);

                  setState(() {
                    data.UpdateCategorieByID(ticketformJson);
                  });
                }
              },
              child: MediumButton(text: "MODIFIER"),
            ),
          ],
        ),
      ),
    );
  }
}
