import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/features/tontines/models_tontines/tontine_model.dart';
import 'package:neta_event_mvvm/features/tontines/views_tontines/payment_screen_tontine.dart';
import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../../Categories/view_model_categories/one_categorie_view_model.dart';
import '../../events/views_events/widgets/categorie_icon_widget.dart';
import '../../users/models_users/event_by_id_model.dart';
import '../../users/models_users/event_model.dart';

class AddTontineView extends StatefulWidget {
  UserModelById? userConnected;
  List<OneCategorieViewModel> allCategories;
  AddTontineView({
    required this.userConnected,
    required this.allCategories,
    super.key,
  });

  @override
  State<AddTontineView> createState() => _AddTontineViewState();
}

class _AddTontineViewState extends State<AddTontineView>
    with TickerProviderStateMixin {
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late String prixfield;
  late String descriptionfield;
  late String periode = '';
  int selectedIndex = -1;

  List<OneCategorieViewModel>? categories = [];
  double _currentSliderValue = 0;
  double _currentSliderValuemontant = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          shadowColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: TextAirbnbCereal(
            title: 'Ajoute Tontine',
            fontWeight: FontWeight.normal,
            size: 20,
            color: Color.fromARGB(255, 0, 0, 0),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextAirbnbCereal(
                      title: 'Nom de la tontine',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    TextFormField(
                      decoration: textFieldDecoration(
                        "Nom de tontine",
                        "entre le nom de tontine",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "entre le nom de tontine";
                        }
                      },
                      onChanged: (text) {
                        libellefield = text;
                      },
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    TextAirbnbCereal(
                      title: 'Montant regulier',
                      fontWeight: FontWeight.normal,
                      size: 18,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    TextFormField(
                      decoration: textFieldDecoration(
                        "Montant",
                        "entre le Montant",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "entre le Montant";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (text) {
                        prixfield = text;
                      },
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    TextAirbnbCereal(
                      title: 'choisir une photo de l evenement',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: SvgPicture.asset(
                            "assets/icon_user/GalleryButton.svg")),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    TextAirbnbCereal(
                      title: 'Type',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(150),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.allCategories.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: CategorieIconWidget(
                                  libelle: widget.allCategories[index].libelle,
                                  backgroundColor: selectedIndex == index
                                      ? const Color(0xffD2286A)
                                      : Colors.grey,
                                ),
                              )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextAirbnbCereal(
                          title: 'Personnes',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text("${_currentSliderValue.toInt()}",
                            style: const TextStyle(
                              fontFamily: 'AirbnbCereal',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Slider(
                      value: _currentSliderValue,
                      max: 100,
                      divisions: 100,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextAirbnbCereal(
                          title: 'montant regulier',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text("${_currentSliderValuemontant.toInt()}",
                            style: const TextStyle(
                              fontFamily: 'AirbnbCereal',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Slider(
                      value: _currentSliderValuemontant,
                      max: 1000,
                      divisions: 1000,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValuemontant = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    TextAirbnbCereal(
                      title: 'Periode',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    periode = "Par semaine";
                                  },
                                  child: Button(
                                    fontWeight: FontWeight.normal,
                                    text: "Par semaine",
                                    height: 40,
                                    width: 100,
                                    fontSize: 15,
                                    gradientbackground: gradientbackground,
                                    textcolor: Colors.white,
                                  )),
                              InkWell(
                                  onTap: () {
                                    periode = "2 semaines";
                                  },
                                  child: Button(
                                    fontWeight: FontWeight.normal,
                                    text: "2 semaines",
                                    height: 40,
                                    width: 100,
                                    fontSize: 15,
                                    gradientbackground: gradientbackground,
                                    textcolor: Colors.white,
                                  )),
                              InkWell(
                                  onTap: () {
                                    periode = "Par mois";
                                  },
                                  child: Button(
                                    fontWeight: FontWeight.normal,
                                    text: "Par mois",
                                    height: 40,
                                    width: 100,
                                    fontSize: 15,
                                    gradientbackground: gradientbackground,
                                    textcolor: Colors.white,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    periode = "2 mois";
                                  },
                                  child: Button(
                                    fontWeight: FontWeight.normal,
                                    text: "2 mois",
                                    height: 40,
                                    width: 100,
                                    fontSize: 15,
                                    gradientbackground: gradientbackground,
                                    textcolor: Colors.white,
                                  )),
                              InkWell(
                                  onTap: () {
                                    periode = "Par Trimestre";
                                  },
                                  child: Button(
                                    fontWeight: FontWeight.normal,
                                    text: "Par Trimestre",
                                    height: 40,
                                    width: 100,
                                    fontSize: 15,
                                    gradientbackground: gradientbackground,
                                    textcolor: Colors.white,
                                  )),
                              InkWell(
                                  onTap: () {
                                    periode = "Par Semestre";
                                  },
                                  child: Button(
                                    fontWeight: FontWeight.normal,
                                    text: "Par semestre ",
                                    height: 40,
                                    width: 100,
                                    fontSize: 15,
                                    gradientbackground: gradientbackground,
                                    textcolor: Colors.white,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            // var tonine = {
                            //   "user_id": widget.userConnected?.id, //int
                            //   "categorie_tontine_id": 18, //int
                            //   "libelle": libellefield, //string
                            //   "periode": periode, //string
                            //   "nbr_participant":
                            //       _currentSliderValue.toInt(), //int
                            //   "montant_regulier":
                            //       _currentSliderValuemontant.toInt(), //int
                            //   "status": "statut", //string
                            //   "image": "htpps://LienDeLimage", //string
                            //   // "created_at": null,
                            //   // "updated_at": null
                            // };

                            var tonine = {
                              "user_id": "1",
                              "categorie_tontine_id": "1",
                              "libelle": "Fete",
                              "periode": "12 mois",
                              "nbr_participant": "60",
                              "montant_regulier": "15000",
                              "status": "Active",
                              "image":
                                  "https://admin.saitech-group.com/api_event/public/Images/1671797177.png",
                              "updated_at": "2023-03-31T14:29:42.000000Z",
                              "created_at": "2023-03-31T14:29:42.000000Z"
                            };

                            TontineModel tontineformJson =
                                TontineModel.fromJson(tonine);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentScreenTontine(
                                          addTontineModel: tontineformJson,
                                        )));
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
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
