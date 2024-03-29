import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../main.dart';
import '../models_tickets/add_ticket_model.dart';
import '../models_tickets/ticket_model.dart';
import '../view_model_tickets/tickets_view_model.dart';

class UpdateTicketView extends StatefulWidget {
  final TicketModel ticketObj;
  const UpdateTicketView ({Key? key, required this.ticketObj}) : super(key: key);

  @override
  State<UpdateTicketView> createState() => _UpdateTicketViewState();
}

class _UpdateTicketViewState extends State<UpdateTicketView> {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late String prixfield;
  late String descriptionfield;

  late String Libellefield;
  late String Prixfield;
  late String Descriptionfield;

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
                  var ticket = {
                    "event_id": widget.ticketObj.id,
                    "libelle": libellefield,
                    "description": descriptionfield,
                    "prix": prixfield,
                    "QR_code": "qr_code",
                    "date": "Date",
                    "statut": "Statut",
                  };

                  AddTicketModel ticketformJson =
                      AddTicketModel.fromJson(ticket);
                  //   print(ticketformJson);

                  setState(() {
                    data.UpdateTicketByID(ticketformJson);
                  });
                }

                navigatorKey.currentState!.popUntil((route) => route.isFirst);
              },
              child: Button(
                text: "MODIFIER",
                fontSize: fontSizemediumbutton,
                gradientbackground: gradientbackground,
                height: heightmediumbutton,
                width: widthmediumbutton,
                fontWeight: FontWeight.normal,
                textcolor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
