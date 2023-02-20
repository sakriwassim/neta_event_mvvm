import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:provider/provider.dart';
import '../../../core/Screen/payment_screen.dart';
import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../../../main.dart';
import '../../Categories/view_model_categories/categories_view_model.dart';
import '../../Categories/view_model_categories/one_categorie_view_model.dart';
import '../../events/views_events/widgets/categorie_icon_widget.dart';
import '../models_tontines/add_tontine_model.dart';
import '../models_tontines/tontine_model.dart';

class AddTontineView extends StatefulWidget {
  const AddTontineView({
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CategoriesViewModel>(context, listen: false)
          .FetchAllCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    var categories =
        Provider.of<CategoriesViewModel>(context, listen: true).categories;
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
                          itemCount: categories.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: CategorieIconWidget(
                                  libelle: categories[index].libelle,
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
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
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
                    // Container(
                    //   margin: const EdgeInsets.only(top: 5, bottom: 5),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Padding(
                    //         padding:
                    //             const EdgeInsets.only(bottom: 10, top: 10),
                    //         child: TextAirbnbCereal(
                    //           title: 'Publicite',
                    //           fontWeight: FontWeight.normal,
                    //           color: Colors.black,
                    //           size: 18,
                    //         ),
                    //       ),
                    //       const Padding(
                    //         padding: EdgeInsets.only(bottom: 10, top: 10),
                    //         child: DropdownButtonExample(),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return const Center(
                            //           child: CircularProgressIndicator());
                            //     });
                            var tonine = {
                              "user_id": 1,
                              "categorie_tontine_id": 18,
                              "libelle": "Libelle",
                              "periode": "periode",
                              "nbr_participant": 15000,
                              "montant_regulier": 1000,
                              "status": "statut",
                              "image": "htpps://LienDeLimage"

                              // "user_id": "1",
                              // "categorie_tontine_id": "18",
                              // "libelle": libellefield,
                              // "periode": "periode",
                              // "nbr_participant": prixfield,
                              // "montant_regulier": "1000",
                              // "status": "statut",
                              // "image": "htpps://LienDeLimage",
                            };

                            AddTontineModel tontineformJson =
                                AddTontineModel.fromJson(tonine);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentScreen(
                                          addTontineModel: tontineformJson,
                                        )));
                          }

                          // navigatorKey.currentState!
                          //     .popUntil((route) => route.isFirst);
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
