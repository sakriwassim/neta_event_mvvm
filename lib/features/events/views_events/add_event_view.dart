import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import '../../../core/widgets/medium_button.dart';
import '../models_events/add_event_model.dart';
import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';

class AddEventView extends StatefulWidget {
  //final OneEventViewModel eventObj;
  AddEventView({
    super.key,
  });

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  int selectedIndex = -1;
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late int prixfield;
  late String descriptionfield;
  late String _yourVariable;
  List<DateTime?> _dataTime = [];

  var data = EventsViewModel(eventsRepository: EventsApi());

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
            "Add event",
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
                  "Nom de levenment",
                  "entre le nom de levenment",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nom de levenment";
                  } else {
                    return null;
                  }
                },
                onChanged: (text) {
                  libellefield = text;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  var _newDate = await showCalendarDatePicker2Dialog(
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(),
                    dialogSize: const Size(325, 400),
                    initialValue: [],
                    borderRadius: BorderRadius.circular(15),
                  );
                  if (_newDate != null) {
                    setState(() {
                      _dataTime = _newDate;
                    });
                  }
                },
                child: Text("Parcourire ce calendrier")),
            Text('${_dataTime}'),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                decoration: textFieldDecoration(
                  "localisation",
                  "entre le localisation",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "le localisation";
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
              child: Wrap(
                direction: Axis.horizontal,
                children: List.generate(5, (index) {
                  return InkWell(
                    onTap: () {
                      print("tapped" + index.toString());
                    },
                    child: Container(
                        height: 50,
                        // margin: const EdgeInsets.only(right: 2),
                        child:
                            Image(image: AssetImage("assets/Ecllipse 5.png"))),
                  );
                }),
              ),

              // TextFormField(
              //   decoration: textFieldDecoration(
              //     "categories",
              //     "entre le categories",
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return "entre le date de mesure";
              //     } else {
              //       return null;
              //     }
              //   },
              //   onChanged: (text) {
              //     descriptionfield = text;
              //   },
              // ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                decoration: textFieldDecoration(
                  "Lien",
                  "entre le Lien",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "entre Lien";
                  } else {
                    return null;
                  }
                },
                onChanged: (text) {
                  descriptionfield = text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                decoration: textFieldDecoration(
                  "publicite",
                  "entre le publicite",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "entre publicite";
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
                        "category_id": 1,
                        "observation_id": 21,
                        "libelle": libellefield,
                        "description": descriptionfield,
                        "prix": prixfield,
                        "date_heure": _dataTime,
                        "adresse": "Stade du 26 Mars",
                        "nbre_tichet": 1000,
                        "status": "statut",
                        "image": "image"
                      };

                      AddEventModel eventformJson =
                          AddEventModel.fromJson(event);
                      print(eventformJson);

                      setState(() {
                        data.AddEvent(eventformJson);
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
