import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/events_api.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/events_local.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/events_view_model.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';
import 'package:neta_event_mvvm/features/events/views_events/add_event_view.dart';

import 'update_event_view.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  var data = EventsViewModel(eventsRepository: EventsApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title)),
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateEventView(
                                              eventObj: events![index])));
                                },
                                child: Container(
                                    height: 190,
                                    child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Container(
                                            height: 166,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                                color: Colors.white,
                                                boxShadow: [
                                                  const BoxShadow(
                                                      offset: Offset(0, 15),
                                                      blurRadius: 25,
                                                      color: Colors.black12),
                                                ]),
                                          ),
                                          Positioned(
                                            top: 40.0,
                                            right: 10,
                                            child: SizedBox(
                                              height: 136,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: 50.0,
                                                      child: Text(
                                                        events![index]
                                                            .libelle
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: 20,
                                                      child: Text(
                                                        events![index]
                                                            .prix
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: 100.0,
                                                      child: Text(
                                                        events![index]
                                                            .description
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              data.DeleteEventByID(
                                                                  events![index]
                                                                      .id);
                                                            });
                                                          },
                                                          child: Text("delete"),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ])),
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
      bottomNavigationBar: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEventView()));
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 0, 225, 255))),
          child: const Text(
            'Add mesure',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
