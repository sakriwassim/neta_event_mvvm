import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/events_api.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/events_local.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/events_view_model.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';
import 'package:neta_event_mvvm/features/events/views_events/add_event_view.dart';

import '../models_events/event_model.dart';
import 'update_event_view.dart';

class GetAllEventView extends StatefulWidget {
  const GetAllEventView({super.key});

  @override
  State<GetAllEventView> createState() => _GetAllEventViewState();
}

class _GetAllEventViewState extends State<GetAllEventView> {
  var data = EventsViewModel(eventsRepository: EventsApi());

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color.fromARGB(214, 229, 11, 218)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddEventView()));
              },
              child: Text("ADD EVENT"),
            ),
          ],
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
                  data.FetchAllEvents();
                });

                return Future.delayed(Duration(seconds: 2));
              },
              child: Center(
                child: FutureBuilder<List<OneEventViewModel>>(
                  future: data.FetchAllEvents(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      var events = snapshot.data;
                      return ListView.builder(
                          itemCount: events?.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  alertupdate(events![index]);
                                },

                                child: ListTile(
                                  title: Text("${events![index].date_heure}",
                                      style: TextStyle(
                                          fontFamily: 'AirbnbCereal',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 211, 7, 194))),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${events![index].description}",
                                          style: TextStyle(
                                            fontFamily: 'AirbnbCereal',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text("${events![index].prix}" + "€",
                                                style: TextStyle(
                                                  fontFamily: 'AirbnbCereal',
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  leading: Image.asset(
                                    "assets/125.png",
                                  ),
                                ),

                                // child: Container(
                                //     height: 190,
                                //     child: Stack(
                                //         alignment: Alignment.bottomCenter,
                                //         children: [
                                //           Container(
                                //             height: 166,
                                //             decoration: BoxDecoration(
                                //                 borderRadius:
                                //                     BorderRadius.circular(22),
                                //                 color: Colors.white,
                                //                 boxShadow: [
                                //                   const BoxShadow(
                                //                       offset: Offset(0, 15),
                                //                       blurRadius: 25,
                                //                       color: Colors.black12),
                                //                 ]),
                                //           ),
                                //           Positioned(
                                //             top: 40.0,
                                //             right: 10,
                                //             child: SizedBox(
                                //               height: 136,
                                //               child: Column(
                                //                 children: [
                                //                   Expanded(
                                //                     child: SizedBox(
                                //                       height: 50.0,
                                //                       child: Text(
                                //                         events![index]
                                //                             .libelle
                                //                             .toString(),
                                //                         style: TextStyle(
                                //                             fontWeight:
                                //                                 FontWeight
                                //                                     .bold),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                   Expanded(
                                //                     child: SizedBox(
                                //                       height: 20,
                                //                       child: Text(
                                //                         events![index]
                                //                             .prix
                                //                             .toString(),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                   Expanded(
                                //                     child: SizedBox(
                                //                       height: 100.0,
                                //                       child: Text(
                                //                         events![index]
                                //                             .description
                                //                             .toString(),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                   // Row(
                                //                   //   children: [
                                //                   //     Padding(
                                //                   //       padding:
                                //                   //           const EdgeInsets
                                //                   //               .all(8.0),
                                //                   //       child: ElevatedButton(
                                //                   //         onPressed: () {
                                //                   //           setState(() {
                                //                   //             data.DeleteEventByID(
                                //                   //                 events![index]
                                //                   //                     .id);
                                //                   //           });
                                //                   //         },
                                //                   //         child: Text("delete"),
                                //                   //       ),
                                //                   //     ),
                                //                   //   ],
                                //                   // )
                                //                 ],
                                //               ),
                                //             ),
                                //           ),
                                //         ])),
                              ));
                    }
                  }),
                ),
              ),
            );
          } else {
            return Center(
              child: Text("no connection"),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
