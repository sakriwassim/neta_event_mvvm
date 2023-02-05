import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neta_event_mvvm/core/decoration.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../main.dart';
import '../models_users/add_event_model.dart';
import '../users_repositories/users_api.dart';
import '../models_users/event_model.dart';
import '../view_model_events/users_view_model.dart';

class UpdateUserView extends StatefulWidget {
  final UserModel eventObj;
  const UpdateUserView({super.key, required this.eventObj});

  @override
  State<UpdateUserView> createState() => _UpdateUserViewState();
}

class _UpdateUserViewState extends State<UpdateUserView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late String prixfield;
  late String descriptionfield;

  //TextEditingController libellefield = TextInputConnection

  var data = UsersViewModel();

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
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(child: CircularProgressIndicator());
                    });

                if (formkey.currentState!.validate()) {
                  var event = {
                    "image": "image8888888888888888888",
                    "created_at": "2022-09-30T15:11:08.000000Z",
                    "updated_at": "2022-09-30T15:11:08.000000Z"
                  };

                  AddUserModel eventformJson = AddUserModel.fromJson(event);

                  setState(() {
                    // data.UpdateUserByID(eventformJson);
                  });
                }

                navigatorKey.currentState!.popUntil((route) => route.isFirst);
              },
              child: Button(
                text: "MODIFIER",
                fontSize: fontSizemediumbutton,
                fontWeight: FontWeight.normal,
                gradientbackground: gradientbackground,
                height: heightmediumbutton,
                width: widthmediumbutton,
                textcolor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
