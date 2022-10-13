import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/colors.dart';
import 'package:neta_event_mvvm/features/events/views_events/events_view.dart';

import 'features/events/evants_repositories/events_api.dart';
import 'features/events/view_model_events/events_view_model.dart';
import 'features/events/view_model_events/one_event_view_model.dart';
import 'features/events/views_events/update_event_view.dart';
import 'features/packs/packs_repositories/packs_api.dart';
import 'features/packs/view_model_packs/one_pack_view_model.dart';
import 'features/packs/view_model_packs/packs_view_model.dart';
import 'features/packs/views_packs/packs_view.dart';
import 'features/tickets/views_tickets/widget/pack_card_widget.dart';

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
      appBar: AppBar(
        shadowColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight:
            MediaQuery.of(context).size.height * 0.15, //set your height
        flexibleSpace: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              gradient: gradientbackground,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/SlashScreen/menus.png",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(Icons.notifications_none,
                              color: Colors.white, size: 30),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(Icons.search,
                            color: Colors.white, size: 30),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Container(
                        height: 22,
                        child: Text(""),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      const SizedBox(
                        width: 150,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Recherche...',
                            hintStyle:
                                TextStyle(fontSize: 15.0, color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.10,
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
                )
              ],
            ),
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
                          const Text("Voir tout",
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
                          const Text("Voir tout",
                              style: TextStyle(
                                fontFamily: 'AirbnbCereal',
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
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
                                  child: ListTile(
                                    title: Text("${events![index].date_heure}",
                                        style: TextStyle(
                                            fontFamily: 'AirbnbCereal',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue)),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('${events[index].description}',
                                            style: TextStyle(
                                              fontFamily: 'AirbnbCereal',
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.location_pin,
                                                size: 20,
                                              ),
                                              Text('${events[index].libelle}',
                                                  style: TextStyle(
                                                    fontFamily: 'AirbnbCereal',
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    leading: Image.asset(
                                      fit: BoxFit.contain,
                                      "assets/124.png",
                                    ),
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Tontine()),
                          // );
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
                    height: 270,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 15,
                        );
                      },
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => SingleTontineScreen()),
                            // );
                          },
                          child: Container(
                            color: Colors.grey[50],
                            child: Stack(
                              children: [
                                ClipPath(
                                    clipper: TriangleClipper(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: gradientbackground),
                                      height: 220,
                                      width: 220,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: 73, left: 20),
                                  child: Container(
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        blurRadius: 15.0,
                                      ),
                                    ]),
                                    child: Container(
                                      height: 180,
                                      width: 180,
                                      color: Colors.white,
                                      child: Column(children: [
                                        Image.asset(
                                          "assets/téléchargement 4.png",
                                          width: 230,
                                          fit: BoxFit.contain,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Mariage',
                                                style: TextStyle(
                                                    fontFamily: 'AirbnbCereal',
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffE28541)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Lorem espium anturium ka',
                                                style: TextStyle(
                                                  fontFamily: 'AirbnbCereal',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '500\$ Chaque trimestre',
                                                style: TextStyle(
                                                  fontFamily: 'AirbnbCereal',
                                                  fontSize: 10,
                                                  color: Color(0xff4F4F4F),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '12 participants',
                                                style: TextStyle(
                                                  fontFamily: 'AirbnbCereal',
                                                  fontSize: 10,
                                                  color: Color(0xff4F4F4F),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: Center(
                                                child: Container(
                                                  height: 25.0,
                                                  width: 50,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: Ink(
                                                      decoration: BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xff8301BC),
                                                              Color(0xffD2286A)
                                                            ],
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0)),
                                                      child: Container(
                                                        constraints:
                                                            const BoxConstraints(
                                                                maxWidth: 270.0,
                                                                minHeight:
                                                                    100.0),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Participer',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'AirbnbCereal',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width / 2, 0) // point p1
      ..lineTo(0, size.height / 3) // point p2
      ..lineTo(size.width, size.height / 3)
      ..lineTo(size.width / 2, 0) // point p3
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
