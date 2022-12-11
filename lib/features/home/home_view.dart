import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/core/sidebar_menu_widget.dart';
import 'package:neta_event_mvvm/core/widgets/exclusive_card_widget.dart';
import 'package:neta_event_mvvm/features/events/views_events/events_bycategoris_view.dart';
import 'package:neta_event_mvvm/search.dart';

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
import '../packs/views_packs/packs_view.dart';
import '../tickets/views_tickets/widget/pack_card_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(
        callbackFunctionlogout: logout,
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 203, 20, 20),
        title: Column(
          children: const [
            Text(
              "Hey Bienvenue..",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Text(
              "Saidou Sawadogo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                icon: const Icon(Icons.notifications_none,
                    color: Colors.white, size: 30),
                onPressed: () {}),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  showSearch(context: context, delegate: SearchElement());

                  //  IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 showSearch(context: context, delegate: SearchElement());
//               },
//             )
                },
                child: const Icon(Icons.search, color: Colors.white, size: 30),
              ),
              const SizedBox(
                width: 150,
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Recherche...',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                ),
              ),
              // Expanded(
              //     child: FutureBuilder<List<OneEventViewModel>>(
              //         future: data.FetchAllEvents(),
              //         builder: (context, snapshot) {
              //           var events = snapshot.data;
              //           return ListView.builder(
              //               itemCount: events?.length,
              //               itemBuilder: (context, index) => GestureDetector(
              //                   onTap: () {
              //                     Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (context) => OnEventView(
              //                                 id: events[index].id,
              //                               )),
              //                     );
              //                   },
              //                   child: ListTile(
              //                     leading: Image.asset("assets/122.png"),
              //                     title: Text("${events![index].libelle}"),
              //                   )));
              //         })),

              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: const Color(0xFF701D53),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Filtres",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                const Text("Exclusives",
                                    style: TextStyle(
                                      fontFamily: 'AirbnbCereal',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )),
                                const Spacer(),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           GetEventByCategorisView()),
                                        // );
                                      },
                                      child: const Text(
                                        "Voir tout",
                                        style: TextStyle(
                                          fontFamily: 'AirbnbCereal',
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.forward_outlined,
                                      color: Colors.grey,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 260,
                            child: SizedBox(
                              height: 260,
                              child: FutureBuilder<List<OneEventViewModel>>(
                                future: data.GetEventByCategorie(2),
                                builder: ((context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    var categories = snapshot.data;
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: categories?.length,
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OnEventView(
                                                            id: categories[
                                                                    index]
                                                                .id,
                                                          )),
                                                );
                                              },
                                              child: ExclusiveCardWidget(
                                                image: 'assets/122.png',
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
                          ),
                          VoirTout(
                            text: 'Catégories',
                            callbackfonction: navGetAllCategorieView,
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
                                  var categories = snapshot.data;
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: categories?.length,
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              indexCategories = index;
                                              print(
                                                  "AAAAAAAAAAAAAAAAAA$indexCategories");

                                              setState(() {
                                                data.GetEventByCategorie(
                                                    indexCategories);
                                              });
                                            },
                                            child: CategorieCardWidget(
                                              libelle:
                                                  categories![index].libelle,
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
                              height: 200,
                              child: GetEventByCategorisView(
                                categorieid: indexCategories,
                              )),
                          VoirTout(
                            text: 'Packs',
                            callbackfonction: navGetAllPackView,
                          ),
                          SizedBox(height: 360, child: GetAllPackView()),
                          VoirTout(
                            text: 'Tontine',
                            callbackfonction: navGetAllTontineView,
                          ),
                          SizedBox(
                            height: 360,
                            child: FutureBuilder<List<OneTontineViewModel>>(
                              future: datatontine.FetchAllTontines(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
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
                                                          id: packs[index].id,
                                                        )),
                                              );
                                            },
                                            child: TontineCardWidget(
                                              libelle: packs![index].libelle,
                                              montant_regulier:
                                                  packs[index].montant_regulier,
                                              nbr_participant:
                                                  packs[index].nbr_participant,
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
    );
  }
}
