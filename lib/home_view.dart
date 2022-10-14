import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/sidebar_menu_widget.dart';
import 'package:neta_event_mvvm/features/events/views_events/events_view.dart';
import 'features/Categories/views_categories/categories_view.dart';
import 'features/events/evants_repositories/events_api.dart';
import 'features/events/view_model_events/events_view_model.dart';
import 'features/events/view_model_events/one_event_view_model.dart';
import 'features/events/views_events/update_event_view.dart';
import 'features/events/views_events/widgets/event_card_widget.dart';
import 'features/packs/packs_repositories/packs_api.dart';
import 'features/packs/view_model_packs/one_pack_view_model.dart';
import 'features/packs/view_model_packs/packs_view_model.dart';
import 'features/packs/views_packs/packs_view.dart';
import 'features/tickets/views_tickets/widget/pack_card_widget.dart';
import 'features/tontines/tontines_repositories/tontines_api.dart';
import 'features/tontines/view_model_tickets/one_tontine_view_model.dart';
import 'features/tontines/view_model_tickets/tontines_view_model.dart';
import 'features/tontines/views_tontines/tontines_view.dart';
import 'features/tontines/views_tontines/widget/tontine_card_widget.dart';

class HomeView extends StatefulWidget {
  HomeView({this.userCat, Key? key}) : super(key: key);
  String? userCat;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  var data = EventsViewModel(eventsRepository: EventsApi());
  var datapack = PacksViewModel(packsRepository: PacksApi());
  var datatontine = TontinesViewModel(ticketsRepository: TontinesApi());

  alertupdate(OneEventViewModel obj) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('êtes-vous sûr!!'),
          content: const Text('de mettre à jour la valeur de compteur'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'MODIFY');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateEventView(eventObj: obj)));
              },
              child: const Text('MODIFY'),
            ),
            TextButton(
                child: const Text('DELETE'),
                onPressed: () {
                  Navigator.pop(context, 'DELETE');
                  setState(() {
                    data.DeleteEventByID(obj.id);
                  });
                }),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 203, 20, 20),
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
                icon: Icon(Icons.notifications_none,
                    color: Colors.white, size: 30),
                onPressed: () {}),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(Icons.search, color: Colors.white, size: 30),
              ),
              SizedBox(
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
              Container(
                  height: 40,
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Color(0xFF701D53),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/SlashScreen/sort.png",
                        width: 20,
                        height: 20,
                      ),
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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                          Text("Voir tout",
                              style: TextStyle(
                                fontFamily: 'AirbnbCereal',
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                          const SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.forward_outlined,
                            color: Colors.grey,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 255,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      shadowColor: Colors.grey,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/122.png"),
                            SizedBox(
                              height: 6,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Merci à tous pour la co...",
                                style: TextStyle(
                                  fontFamily: 'AirbnbCereal',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.pink, size: 15),
                                      Icon(Icons.star,
                                          color: Colors.pink, size: 15),
                                      Icon(Icons.star,
                                          color: Colors.pink, size: 15),
                                      Icon(Icons.star,
                                          color: Colors.pink, size: 15),
                                      Icon(Icons.star,
                                          color: Colors.grey, size: 15),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Text(
                                    "Prix : 70€",
                                    style: TextStyle(
                                        fontFamily: 'AirbnbCereal',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.location_on_outlined,
                                      color: Colors.grey),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '36 Guild Street, Bamako',
                                    style: TextStyle(
                                      fontFamily: 'AirbnbCereal',
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      const Text("Catégories",
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GetAllCategorieView()),
                                );
                              },
                              child: const Text("Voir tout",
                                  style: TextStyle(
                                    fontFamily: 'AirbnbCereal',
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ))),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.forward_outlined,
                            color: Colors.grey,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 115,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) => Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 2,
                      shadowColor: Colors.grey,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        child: Stack(
                          children: [
                            Image.asset("assets/123.png"),
                            const Positioned(
                              top: 25,
                              left: 10,
                              child: Text('Musique &\nchant',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'AirbnbCereal',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Text("Evènements",
                          style: TextStyle(
                            fontFamily: 'AirbnbCereal',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GetAllEventView()),
                          );
                        },
                        child: Row(
                          children: [
                            Text("Voir tout",
                                style: TextStyle(
                                  fontFamily: 'AirbnbCereal',
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 360,
                  child: FutureBuilder<List<OneEventViewModel>>(
                    future: data.FetchAllEvents(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        var events = snapshot.data;
                        return ListView.builder(
                            itemCount: events?.length,
                            itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    alertupdate(events[index]);
                                  },
                                  child: EventCardWidget(
                                    date_heure: events![index].date_heure,
                                    events: events,
                                    description: events[index].description,
                                    libelle: events[index].libelle,
                                  ),
                                ));
                      }
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Row(
                    children: [
                      Text("Packs",
                          style: TextStyle(
                            fontFamily: 'AirbnbCereal',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GetAllPackView()),
                          );
                        },
                        child: Row(
                          children: [
                            Text("Voir tout",
                                style: TextStyle(
                                  fontFamily: 'AirbnbCereal',
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 360,
                  child: FutureBuilder<List<OnePackViewModel>>(
                    future: datapack.FetchAllPacks(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        var packs = snapshot.data;
                        return Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: packs?.length,
                              itemBuilder: (context, index) => PackCardWidget(
                                    libelle: packs![index].libelle,
                                  )),
                        );
                      }
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Text("Tontine",
                          style: TextStyle(
                            fontFamily: 'AirbnbCereal',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GetAllTontineView()),
                          );
                        },
                        child: Row(
                          children: [
                            Text("Voir tout",
                                style: TextStyle(
                                  fontFamily: 'AirbnbCereal',
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.forward_outlined,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 360,
                  child: FutureBuilder<List<OneTontineViewModel>>(
                    future: datatontine.FetchAllTontines(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        var packs = snapshot.data;
                        return Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: packs?.length,
                              itemBuilder: (context, index) =>
                                  TontineCardWidget(
                                    libelle: packs![index].libelle,
                                    montant_regulier:
                                        packs![index].montant_regulier,
                                    nbr_participant:
                                        packs![index].nbr_participant,
                                  )),
                        );
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
