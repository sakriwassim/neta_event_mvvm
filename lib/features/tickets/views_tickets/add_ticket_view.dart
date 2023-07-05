import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/widgets/small_button_style.dart';
import '../models_tickets/add_ticket_model.dart';
import '../view_model_tickets/tickets_view_model.dart';

class AddTicketView extends StatefulWidget {

  const AddTicketView ({Key? key}) : super(key: key);

  @override
  State<AddTicketView> createState() => _AddTicketViewState();
}

class _AddTicketViewState extends State<AddTicketView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late String prixfield;
  late String descriptionfield;

  var data = TicketsViewModel();

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
            "Add Ticket",
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
                      "event_id": 1,
                      "libelle": libellefield,
                      "description": descriptionfield,
                      "prix": prixfield,
                      "QR_code": "qr_code",
                      "date": "Date",
                      "statut": "Statut"
                    };

                    AddTicketModel ticketformJson =
                        AddTicketModel.fromJson(ticket);

                    setState(() {
                      data.AddTicket(ticketformJson);
                    });
                  }
                },
                child: Button(
                  text: "APPLIQUER",
                  fontSize: fontSizemediumbutton,
                  gradientbackground: gradientbackground,
                  height: heightmediumbutton,
                  width: widthmediumbutton,
                  fontWeight: FontWeight.normal,
                  textcolor: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
