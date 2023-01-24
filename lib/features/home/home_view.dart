// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/colors.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/search.dart';
import '../../core/size_config.dart';
import '../../core/string.dart';
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
import '../notification/views_notifications/notifications_view.dart';
import '../users/evants_repositories/events_api.dart';
import '../users/view_model_events/events_view_model.dart';
import 'widget/events_bycategoris_view.dart';
import '../events/views_events/events_view.dart';
import '../packs/packs_repositories/packs_api.dart';
import '../packs/view_model_packs/one_pack_view_model.dart';
import '../packs/view_model_packs/packs_view_model.dart';
import '../packs/views_packs/packs_view.dart';
import '../packs/widget/pack_card_widget.dart';
import '../tontines/tontines_repositories/tontines_api.dart';
import '../tontines/view_model_tickets/one_tontine_view_model.dart';
import '../tontines/view_model_tickets/tontines_view_model.dart';
import '../tontines/views_tontines/one_tontine_view.dart';
import '../tontines/views_tontines/tontines_view.dart';
import '../tontines/views_tontines/widget/tontine_card_widget.dart';
import 'widget/events_exclusives_widget.dart';
import 'widget/voirtout.dart';

class HomeView extends StatefulWidget {
  String? userCat;

  HomeView({
    Key? key,
    this.userCat,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int indexCategories = 0;

  var datauser = UsersViewModel(eventsRepository: UsersApi());
  var data = EventsViewModel(eventsRepository: EventsApi());
  var datapack = PacksViewModel(packsRepository: PacksApi());
  var datatontine = TontinesViewModel(ticketsRepository: TontinesApi());
  var datacategorie = CategoriesViewModel(ticketsRepository: CategoriesApi());
  // var data2 = AuthentificationViewModel(
  //     authentificationRepository: AuthentificationApi());

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

  navGetAllNotificationView() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GetAllNotificationView()),
    );
  }

  Widget SearchWidget() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {
                showSearch(context: context, delegate: SearchElement());
              },
              child: SvgPicture.asset(search)),
          SvgPicture.asset(Line),
          SizedBox(
            width: getProportionateScreenWidth(180),
            child: TextField(
              onTap: (() {
                showSearch(context: context, delegate: SearchElement());
              }),
              decoration: const InputDecoration(
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
    );
  }

  Widget packsWidget() {
    return SizedBox(
      height: getProportionateScreenHeight(300),
      child: Center(
        child: FutureBuilder<List<OnePackViewModel>>(
          future: datapack.FetchAllPacks(),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              var events = snapshot.data;
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: events?.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {},
                        child: PackCardWidget(
                          libelle: '${events![index].libelle}',
                          montant: '${events[index].montant}',
                          nbre_events: '${events[index].nbre_events}',
                          nbre_jr_pubs: '${events[index].nbre_jr_pubs}',
                        ),
                      ));
            }
          }),
        ),
      ),
    );
  }

  Widget tontinesWidget() {
    return SizedBox(
      height: getProportionateScreenHeight(350),
      child: FutureBuilder<List<OneTontineViewModel>>(
        future: datatontine.FetchAllTontines(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var packs = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: packs?.length,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnTontineView(
                                    id: packs[index].id,
                                    image: '${packs[index].image}',
                                  )),
                        );
                      },
                      child: TontineCardWidget(
                        image: packs![index].image,
                        libelle: packs[index].libelle,
                        montant_regulier: packs[index].montant_regulier,
                        nbr_participant: packs[index].nbr_participant,
                        // image: packs[index].image,
                      ),
                    ));
          }
        }),
      ),
    );
  }

  Widget appbarWidget() {
    return Column(
      children: [
        const Text(
          "Hey Bienvenue..",
          style: TextStyle(
            fontFamily: 'AirbnbCereal',
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Color.fromARGB(135, 255, 255, 255),
          ),
        ),
        FutureBuilder(
            future: datauser.GetUserConnected(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    // child: CircularProgressIndicator()
                    );
              } else {
                var categories = snapshot.data;
                return Text(
                  "${categories!.nom_complet}",
                  style: const TextStyle(
                    fontFamily: 'AirbnbCereal',
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    color: Colors.white,
                  ),
                );
              }
            })),
      ],
    );
  }

  Widget categoriesWidget() {
    return SizedBox(
      height: getProportionateScreenHeight(150),
      child: FutureBuilder<List<OneCategorieViewModel>>(
        future: datacategorie.FetchAllCategories(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                // child: CircularProgressIndicator()
                );
          } else {
            var categories = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories?.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        indexCategories = index;

                        setState(() {
                          // data.GetEventByCategorie(
                          //     2);
                        });
                      },
                      child: CategorieCardWidget(
                        libelle: categories![index].libelle,
                        image: categories[index].image,
                      ),
                    ));
          }
        }),
      ),
    );
  }

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              shape: BoxShape.circle,
                              gradient: gradientbackground),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              ProfileBnt,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      // IconButton(
                      //     icon: SvgPicture.asset(CombinedShape),
                      //     onPressed: () {
                      //       Scaffold.of(context).openDrawer();
                      //     }),
                      //Spacer(),
                      appbarWidget(),
                      // Spacer(),
                      Row(
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.favorite_border_sharp,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // navGetAllNotificationView();
                              }),
                          IconButton(
                              icon: SvgPicture.asset(Notif),
                              onPressed: () {
                                navGetAllNotificationView();
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                SearchWidget()
              ],
            ),
          ),
          Expanded(
            child: OfflineBuilder(
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
                          data.FetchAllEvents("");
                          datapack.FetchAllPacks();
                          datatontine.FetchAllTontines();
                          datacategorie.FetchAllCategories();
                        });

                        return Future.delayed(const Duration(seconds: 2));
                      },
                      child: FutureBuilder(
                        future: datauser.GetUserConnected(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          } else {
                            //var body = snapshot.data;
                            var role = snapshot.data!.role_id.toString();

                            return SingleChildScrollView(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //****************** Exclusives*/
                                      VoirTout(
                                        text: 'Exclusives',
                                        callbackfonction: navGetAllEventView,
                                      ),
                                      EventsExclusivesWidget(),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
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

                                      categoriesWidget(),

                                      VoirTout(
                                        text: 'Evènements',
                                        callbackfonction: navGetAllEventView,
                                      ),
                                      GetEventByCategorisWidget(
                                        categorieid: indexCategories,
                                      ),
                                      role == "0"
                                          ? Container()
                                          : Column(
                                              children: [
                                                VoirTout(
                                                  text: 'Packs',
                                                  callbackfonction:
                                                      navGetAllPackView,
                                                ),
                                                packsWidget(),
                                              ],
                                            ),
                                      VoirTout(
                                        text: 'Tontine',
                                        callbackfonction: navGetAllTontineView,
                                      ),
                                      tontinesWidget(),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                          }
                        },
                      ));
                } else {
                  return const Center(
                    child: Text("no connection"),
                  );
                }
              },
              child: const CircularProgressIndicator(),
            ),
          ),
        ]),
      ),
    );
  }
}
