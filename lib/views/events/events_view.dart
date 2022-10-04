import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/repositories/evants_repositories/events_api.dart';
import 'package:neta_event_mvvm/view_model/events_view_model.dart';
import 'package:neta_event_mvvm/view_model/one_event_view_model.dart';
import 'package:neta_event_mvvm/views/events/add_event_view.dart';

import 'update_event_view.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  // dependency Injection
  var data = EventsViewModel(eventsRepository: EventsApi());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title)),
      body: RefreshIndicator(
        onRefresh: () async {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const EventView(),
              ));
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
                                                          FontWeight.bold),
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
                                                      const EdgeInsets.all(8.0),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      data.DeleteEventByID(
                                                          events![index].id);
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
                  MaterialStateProperty.all(const Color(0xFFFF8000))),
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
