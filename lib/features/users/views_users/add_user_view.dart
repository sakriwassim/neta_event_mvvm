import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/features/events/views_events/widgets/categorie_icon_widget.dart';
import 'package:provider/provider.dart';
import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../main.dart';
import '../../Categories/view_model_categories/one_categorie_view_model.dart';
import '../models_users/add_event_model.dart';
import '../view_model_events/users_view_model.dart';

class AddUserView extends StatefulWidget {

  const AddUserView ({Key? key}) : super(key: key);

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  int selectedIndex = -1;
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late int prixfield;
  late String descriptionfield;
  late String _yourVariable;
  List<DateTime?> _dataTime = [];
  List<OneCategorieViewModel>? categories = [];
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<UsersViewModel>(context, listen: true);
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
                child: const Text("Parcourire ce calendrier")),
            Text('$_dataTime'),
            Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 5, bottom: 5),
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
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
              alignment: Alignment.topLeft,
              child: const Text("Categories",
                  style: TextStyle(
                    fontFamily: 'AirbnbCereal',
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            SizedBox(
              height: 120,
              child: FutureBuilder<List<OneCategorieViewModel>>(
                // future: datacategorie.FetchAllCategories(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    categories = snapshot.data;
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories?.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: CategorieIconWidget(
                                libelle: categories![index].libelle,
                                backgroundColor: selectedIndex == index
                                    ? const Color(0xffD2286A)
                                    : Colors.grey,
                              ),
                            ));
                  }
                }),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Selection le prix",
                            style: TextStyle(
                              fontFamily: 'AirbnbCereal',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text("${_currentSliderValue.toInt()}",
                            style: const TextStyle(
                              fontFamily: 'AirbnbCereal',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slider(
                      value: _currentSliderValue,
                      max: 100,
                      divisions: 100,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 5, bottom: 5),
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
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(child: CircularProgressIndicator());
                      });

                  if (formkey.currentState!.validate()) {
                    var event = {
                      "category_id": categories![selectedIndex].id,
                      "observation_id": 21,
                      "libelle": "$libellefield",
                      "description": "$descriptionfield",
                      "prix": _currentSliderValue.toInt(),
                      "date_heure": _dataTime.toString(),
                      "adresse": "Stade du 26 Mars",
                      "nbre_tichet": 1000,
                      "status": "statut",
                      "image": "image"
                    };

                    AddUserModel eventformJson = AddUserModel.fromJson(event);

                    setState(() {
                      data.AddUser(eventformJson);
                    });
                  }

                  navigatorKey.currentState!.popUntil((route) => route.isFirst);
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
