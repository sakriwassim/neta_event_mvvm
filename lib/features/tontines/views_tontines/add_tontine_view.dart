import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import '../../../core/widgets/dropdown_button_example.dart';
import '../../../core/widgets/medium_button.dart';
import '../../Categories/categories_repositories/categories_api.dart';
import '../../Categories/view_model_categories/categories_view_model.dart';
import '../../Categories/view_model_categories/one_categorie_view_model.dart';
import '../../events/views_events/widgets/categorie_icon_widget.dart';
import '../models_tontines/tontine_model.dart';
import '../tontines_repositories/tontines_api.dart';
import '../view_model_tickets/tontines_view_model.dart';

class AddTontineView extends StatefulWidget {
  AddTontineView({
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
  int selectedIndex = -1;

  List<OneCategorieViewModel>? categories = [];
  double _currentSliderValue = 0;
  var datacategorie = CategoriesViewModel(ticketsRepository: CategoriesApi());

  var data = TontinesViewModel(ticketsRepository: TontinesApi());

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
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
            "Ajout Tontine",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Color.fromARGB(255, 214, 9, 204),
                  isScrollable: true,
                  controller: _tabController,
                  labelColor: Color.fromARGB(255, 214, 9, 204),
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Text("1"),
                    Text("2"),
                  ],
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 1000,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
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
                          Padding(
                            padding: const EdgeInsets.all(15),
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
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, right: 10, left: 10),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: SvgPicture.asset(
                                    "assets/icon_user/GalleryButton.svg")),
                          ),
                          SizedBox(
                            height: 120,
                            child: FutureBuilder<List<OneCategorieViewModel>>(
                              future: datacategorie.FetchAllCategories(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
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
                                    const Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text("Personnes",
                                          style: TextStyle(
                                            fontFamily: 'AirbnbCereal',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
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
                                  padding: const EdgeInsets.all(8.0),
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
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text("Publicite",
                                      style: TextStyle(
                                        fontFamily: 'AirbnbCereal',
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: DropdownButtonExample(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: InkWell(
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    var ticket = {
                                      "id": 1,
                                      "user_id": "1",
                                      "libelle": libellefield,
                                      "periode": descriptionfield,
                                      "nbr_participant": prixfield,
                                      "montant_regulier": "1000",
                                      "status": "statut",
                                      "image": "htpps://LienDeLimage",
                                      "created_at":
                                          "2022-10-11T12:27:41.000000Z",
                                      "updated_at":
                                          "2022-10-11T12:27:41.000000Z"
                                    };

                                    TontineModel ticketformJson =
                                        TontineModel.fromJson(ticket);
                                    // print(ticketformJson);

                                    setState(() {
                                      data.AddTontine(ticketformJson);
                                    });
                                  }
                                },
                                child: MediumButton(text: "APPLIQUER")),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: InkWell(
                                onTap: () {},
                                child: MediumButton(text: "PAYPAL")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: InkWell(
                                onTap: () {},
                                child: MediumButton(text: "VISA")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: InkWell(
                                onTap: () {},
                                child: MediumButton(text: "WAVA")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: InkWell(
                                onTap: () {},
                                child: MediumButton(text: "APPLIQUER")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: InkWell(
                                onTap: () {},
                                child: MediumButton(text: "APPLIQUER")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: InkWell(
                                onTap: () {},
                                child: MediumButton(text: "MooV")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: InkWell(
                                onTap: () {},
                                child: MediumButton(text: "Place My Order")),
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
