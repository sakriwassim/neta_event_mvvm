import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neta_event_mvvm/core/colors.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/core/sidebar_menu_widget.dart';
import 'package:neta_event_mvvm/features/events/views_events/events_bycategoris_view.dart';
import 'package:neta_event_mvvm/search.dart';

import '../../core/size_config.dart';
import '../../core/string.dart';
import '../../core/widgets/exclusive_card_widget.dart';
import '../../core/widgets/text_widget_text1.dart';
import '../Categories/categories_repositories/categories_api.dart';
import '../Categories/view_model_categories/categories_view_model.dart';
import '../Categories/view_model_categories/one_categorie_view_model.dart';
import '../Categories/views_categories/categories_view.dart';
import '../Categories/views_categories/widget/categorie_card_widget.dart';
import '../authentification/authentification_repositories/authentification_api.dart';
import '../authentification/view_model_authentification/authentification_view_model.dart';
import '../events/evants_repositories/events_api.dart';
import '../events/view_model_events/events_view_model.dart';
import '../events/view_model_events/one_event_view_model.dart';
import '../events/views_events/events_view.dart';
import '../events/views_events/one_event_view.dart';
import '../events/views_events/widgets/event_card_widget.dart';
import '../packs/packs_repositories/packs_api.dart';
import '../packs/view_model_packs/one_pack_view_model.dart';
import '../packs/view_model_packs/packs_view_model.dart';
import '../packs/views_packs/get_all_pack_view_body.dart';
import '../packs/views_packs/packs_view.dart';
import '../packs/widget/pack_card_widget.dart';
import '../tontines/tontines_repositories/tontines_api.dart';
import '../tontines/view_model_tickets/one_tontine_view_model.dart';
import '../tontines/view_model_tickets/tontines_view_model.dart';
import '../tontines/views_tontines/one_tontine_view.dart';
import '../tontines/views_tontines/tontines_view.dart';
import '../tontines/views_tontines/widget/tontine_card_widget.dart';
import 'widget/voirtout.dart';

class HomeView extends StatefulWidget {
  String? userCat;

  HomeView({this.userCat, Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  var data = EventsViewModel(eventsRepository: EventsApi());
  var datapack = PacksViewModel(packsRepository: PacksApi());
  var datatontine = TontinesViewModel(ticketsRepository: TontinesApi());
  var datacategorie = CategoriesViewModel(ticketsRepository: CategoriesApi());
  var data2 = AuthentificationViewModel(
      authentificationRepository: AuthentificationApi());
  var indexCategories = 0;

  logout() {
    setState(() {
      data2.Cleanpref();
    });
  }

  navGetAllCategorieView() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GetAllCategorieView()),
    );
  }

  navGetAllEventView() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GetAllEventView()),
    );
  }

  navGetAllPackView() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GetAllPackView()),
    );
  }

  navGetAllTontineView() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GetAllTontineView()),
    );
  }

// drawer: SideBarMenu(
  //   callbackFunctionlogout: logout,
  // ),

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            height: getProportionateScreenHeight(150),
            decoration: const BoxDecoration(
                gradient: gradientbackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(20),
                      horizontal: getProportionateScreenWidth(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: SvgPicture.asset(CombinedShape),
                          onPressed: () {}),
                      Column(
                        children: const [
                          Text(
                            "Hey Bienvenue..",
                            style: TextStyle(
                              fontFamily: 'AirbnbCereal',
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color.fromARGB(135, 255, 255, 255),
                            ),
                          ),
                          Text(
                            "Saidou Sawadogo",
                            style: TextStyle(
                              fontFamily: 'AirbnbCereal',
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          icon: SvgPicture.asset(Notif), onPressed: () {}),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            showSearch(
                                context: context, delegate: SearchElement());
                          },
                          child: SvgPicture.asset(search)),
                      SvgPicture.asset(Line),
                      SizedBox(
                        width: getProportionateScreenWidth(180),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Chercher',
                            hintStyle: TextStyle(
                                fontFamily: 'AirbnbCereal',
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                                color: Color.fromARGB(137, 255, 255, 255)),
                          ),
                        ),
                      ),
                      Container(
                          height: heightfliterbutton,
                          width: widthfliterbutton,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: const Color(0xFF701D53),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(filtercircle),
                              TextAirbnbCereal(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                size: 15,
                                title: 'Filtres',
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: OfflineBuilder(
                connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child,
                ) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  if (connected) {
                    return RefreshIndicator(
                        onRefresh: () async {
                          setState(() {
                            data.GetEventByCategorie(indexCategories);
                            data.FetchAllEvents();
                            datapack.FetchAllPacks();
                            datatontine.FetchAllTontines();
                            datacategorie.FetchAllCategories();
                          });

                          return Future.delayed(const Duration(seconds: 2));
                        },
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /******Exclusives********************************* */
                                  VoirTout(
                                    text: 'Exclusives',
                                    callbackfonction: navGetAllEventView,
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(250),
                                    child:
                                        FutureBuilder<List<OneEventViewModel>>(
                                      future: data.GetEventByCategorie(2),
                                      builder: ((context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child:
                                                  //Container()
                                                  CircularProgressIndicator());
                                        } else {
                                          var categories = snapshot.data;
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: categories?.length,
                                              itemBuilder:
                                                  (context, index) =>
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        OneEventView(
                                                                          id: categories[index]
                                                                              .id,
                                                                        )),
                                                          );
                                                        },
                                                        child:
                                                            ExclusiveCardWidget(
                                                          date:
                                                              "${categories![index].date_heure}",
                                                          image:
                                                              "${categories![index].image}",
                                                          adresse:
                                                              "${categories![index].adresse}",
                                                          libelle:
                                                              "${categories[index].libelle}",
                                                          prix:
                                                              "${categories[index].prix}",
                                                        ),
                                                      ));
                                        }
                                      }),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(15),
                                    ),
                                    child: const Text(
                                      "Catégories",
                                      style: TextStyle(
                                        fontFamily: 'AirbnbCereal',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(150),
                                    child: FutureBuilder<
                                        List<OneCategorieViewModel>>(
                                      future:
                                          datacategorie.FetchAllCategories(),
                                      builder: ((context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child:
                                                  // Container()
                                                  CircularProgressIndicator());
                                        } else {
                                          var categories = snapshot.data;
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: categories?.length,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                    onTap: () {
                                                      indexCategories = index;

                                                      setState(() {
                                                        data.GetEventByCategorie(
                                                            indexCategories);
                                                      });
                                                    },
                                                    child: CategorieCardWidget(
                                                      libelle:
                                                          categories![index]
                                                              .libelle,
                                                      image: categories![index]
                                                          .image,
                                                    ),
                                                  ));
                                        }
                                      }),
                                    ),
                                  ),
                                  VoirTout(
                                    text: 'Evènements',
                                    callbackfonction: navGetAllEventView,
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(300),
                                    child: Center(
                                      child: FutureBuilder<
                                          List<OneEventViewModel>>(
                                        future: data.GetEventByCategorie(
                                            indexCategories),
                                        builder: ((context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          } else {
                                            var events = snapshot.data;
                                            return ListView.builder(
                                                itemCount: events?.length,
                                                itemBuilder: (context, index) =>
                                                    GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        OneEventView(
                                                                          id: events[index]
                                                                              .id,
                                                                        )),
                                                          );
                                                        },
                                                        child:
                                                            EventCardWidgetHome(
                                                          description:
                                                              events![index]
                                                                  .description,
                                                          events: events,
                                                          date_heure:
                                                              events[index]
                                                                  .date_heure,
                                                          libelle: events[index]
                                                              .libelle,
                                                          adresse: events[index]
                                                              .adresse,
                                                          image: events![index]
                                                              .image,
                                                        )));
                                          }
                                        }),
                                      ),
                                    ),
                                  ),
                                  VoirTout(
                                    text: 'Packs',
                                    callbackfonction: navGetAllPackView,
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(300),
                                    child: Center(
                                      child:
                                          FutureBuilder<List<OnePackViewModel>>(
                                        future: datapack.FetchAllPacks(),
                                        builder: ((context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          } else {
                                            var events = snapshot.data;
                                            return ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: events?.length,
                                                itemBuilder: (context, index) =>
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: PackCardWidget(
                                                        libelle:
                                                            '${events![index].libelle}',
                                                        montant:
                                                            '${events![index].montant}',
                                                        nbre_events:
                                                            '${events![index].nbre_events}',
                                                        nbre_jr_pubs:
                                                            '${events![index].nbre_jr_pubs}',
                                                      ),
                                                    ));
                                          }
                                        }),
                                      ),
                                    ),
                                  ),
                                  VoirTout(
                                    text: 'Tontine',
                                    callbackfonction: navGetAllTontineView,
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(350),
                                    child: FutureBuilder<
                                        List<OneTontineViewModel>>(
                                      future: datatontine.FetchAllTontines(),
                                      builder: ((context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else {
                                          var packs = snapshot.data;
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: packs?.length,
                                              itemBuilder: (context, index) =>
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                OnTontineView(
                                                                  id: packs[
                                                                          index]
                                                                      .id,
                                                                )),
                                                      );
                                                    },
                                                    child: TontineCardWidget(
                                                      image:
                                                          packs![index].image,
                                                      libelle:
                                                          packs![index].libelle,
                                                      montant_regulier:
                                                          packs[index]
                                                              .montant_regulier,
                                                      nbr_participant:
                                                          packs[index]
                                                              .nbr_participant,
                                                      // image: packs[index].image,
                                                    ),
                                                  ));
                                        }
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )));
                  } else {
                    return const Center(
                      child: Text("no connection"),
                    );
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'There are no bottons to push :)',
                    ),
                    Text(
                      'Just turn off your internet.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
