import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/card_google_widget.dart';
import '../../../core/widgets/dropdown_button_example.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../../../main.dart';
import '../../Categories/categories_repositories/categories_api.dart';
import '../../Categories/view_model_categories/categories_view_model.dart';
import '../../Categories/view_model_categories/one_categorie_view_model.dart';
import '../../events/views_events/widgets/categorie_icon_widget.dart';
import '../models_tontines/tontine_model.dart';
import '../tontines_repositories/tontines_api.dart';
import '../view_model_tickets/tontines_view_model.dart';

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
  var datacategorie = CategoriesViewModel();

  var data = TontinesViewModel( );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TabController _tabController = TabController(length: 2, vsync: this);
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
            title: 'Ajout Tontine',
            fontWeight: FontWeight.normal,
            size: 15,
            color: Colors.white,
          )),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                TabBar(
                  indicatorColor: const Color.fromARGB(255, 214, 9, 204),
                  isScrollable: true,
                  controller: _tabController,
                  labelColor: const Color.fromARGB(255, 214, 9, 204),
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Text("1"),
                    Text("2"),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: getProportionateScreenHeight(1500),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextAirbnbCereal(
                            title: 'Nom de la tontine',
                            fontWeight: FontWeight.normal,
                            color: null,
                            size: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: TextFormField(
                              decoration: textFieldDecoration(
                                "Nom de tontine",
                                "entre le nom de tontine",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "entre le nom de tontine";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                libellefield = text;
                              },
                            ),
                          ),
                          TextAirbnbCereal(
                            title: 'Montant regulier',
                            fontWeight: FontWeight.normal,
                            size: 18,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: TextFormField(
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
                          ),
                          TextAirbnbCereal(
                            title: 'choisir une photo de l evenement',
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            size: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: SvgPicture.asset(
                                    "assets/icon_user/GalleryButton.svg")),
                          ),
                          TextAirbnbCereal(
                            title: 'Type',
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            size: 18,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(200),
                            child: FutureBuilder<List<OneCategorieViewModel>>(
                            //  future: datacategorie.FetchAllCategories(),
                              builder: ((context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                      child: CircularProgressIndicator());
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
                                              libelle:
                                                  categories![index].libelle,
                                              backgroundColor:
                                                  selectedIndex == index
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: TextAirbnbCereal(
                                        title: 'Personnes',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child:
                                          Text("${_currentSliderValue.toInt()}",
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
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Slider(
                                    value: _currentSliderValue,
                                    max: 100,
                                    divisions: 100,
                                    label:
                                        _currentSliderValue.round().toString(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          gradientbackground:
                                              gradientbackground,
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
                                          gradientbackground:
                                              gradientbackground,
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
                                          gradientbackground:
                                              gradientbackground,
                                          textcolor: Colors.white,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          gradientbackground:
                                              gradientbackground,
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
                                          gradientbackground:
                                              gradientbackground,
                                          textcolor: Colors.white,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          periode = "Par semestre";
                                        },
                                        child: Button(
                                          fontWeight: FontWeight.normal,
                                          text: "Par semestre ",
                                          height: 40,
                                          width: 100,
                                          fontSize: 15,
                                          gradientbackground:
                                              gradientbackground,
                                          textcolor: null,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: TextAirbnbCereal(
                                    title: 'Publicite',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10, top: 10),
                                  child: DropdownButtonExample(),
                                ),
                              ],
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
                                    "id": 1,
                                    "user_id": "1",
                                    "libelle": libellefield,
                                    "periode": "periode",
                                    "nbr_participant": prixfield,
                                    "montant_regulier": "1000",
                                    "status": "statut",
                                    "image": "htpps://LienDeLimage",
                                    "created_at": "2022-10-11T12:27:41.000000Z",
                                    "updated_at": "2022-10-11T12:27:41.000000Z"
                                  };

                                  TontineModel ticketformJson =
                                      TontineModel.fromJson(ticket);
                                  // print(ticketformJson);

                                  setState(() {
                                    data.AddTontine(ticketformJson);
                                  });
                                }



                            navigatorKey.currentState!
                          .popUntil((route) => route.isFirst);
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: InkWell(
                              onTap: () {},
                              child: CardGoogle(
                                image: 'assets/tontine/paypal.png',
                                title: 'PAYPAL',
                                height: 80,
                                width: 300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: InkWell(
                              onTap: () {},
                              // child: MediumButton(text: "VISA")

                              child: CardGoogle(
                                image: 'assets/tontine/visa.png',
                                title: 'VISA',
                                height: 80,
                                width: 300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            // padding: const EdgeInsets.all(15),
                            child: InkWell(
                              onTap: () {},
                              child: CardGoogle(
                                image: 'assets/tontine/payoneer.png',
                                title: 'payoneer',
                                height: 80,
                                width: 300,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(15),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 200,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    gradient: gradientbackground,
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Text(
                                              "Tontine groupe",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "12 personnes",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Text(
                                              "Price",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "5 Fcfa",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Text(
                                              "Total",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "5 Fcfa",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 50,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(13.0),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Place My Order",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 213, 33, 171),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              )

                              //MediumButton(text: "Place My Order")),
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
