import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:neta_event_mvvm/core/decoration.dart';

import '../../../core/widgets/medium_button.dart';
import '../../core/string.dart';
import '../users/evants_repositories/events_api.dart';
import '../users/models_events/add_event_model.dart';
import '../users/view_model_events/events_view_model.dart';

class AddUserViewWeb extends StatefulWidget {
  AddUserViewWeb({
    super.key,
  });

  @override
  State<AddUserViewWeb> createState() => _AddUserViewWebState();
}

class _AddUserViewWebState extends State<AddUserViewWeb> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late String prixfield;
  late String descriptionfield;

  var data = UsersViewModel(eventsRepository: UsersApi());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.cyan,
        height: screenHeight,
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.1,
                // width: screenWidth * 0.1,
                child: CircleAvatar(
                  radius: 50.0,
                  // backgroundImage: Image.asset(defaultImage),
                  //   backgroundImage: NetworkImage(snapshot.data!.image),
                  backgroundColor: Colors.blue,
                ),
              ),
              Container(
                height: screenHeight * 0.1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight * 0.1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight * 0.1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight * 0.1,
                child: InkWell(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        var ticket = {
                          "event_id": 1,
                          "libelle": libellefield,
                          "description": descriptionfield,
                          "prix": prixfield,
                          "QR_code": "qr_code",
                          "date": "Date",
                          "statut": "Statut"
                        };

                        AddUserModel ticketformJson =
                            AddUserModel.fromJson(ticket);
                        print(ticketformJson);

                        setState(() {
                          data.AddUser(ticketformJson);
                        });
                      }
                    },
                    child: MediumButton(text: "APPLIQUER")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
