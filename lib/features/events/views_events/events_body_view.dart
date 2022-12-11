import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/features/events/views_events/widgets/event_card_widget.dart';

import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';
import '../view_model_events/one_event_view_model.dart';
import 'one_event_view.dart';

class GetAllEventViewBody extends StatefulWidget {
  const GetAllEventViewBody({super.key});

  @override
  State<GetAllEventViewBody> createState() => _GetAllEventViewBodyState();
}

class _GetAllEventViewBodyState extends State<GetAllEventViewBody> {
  var data = EventsViewModel(eventsRepository: EventsApi());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OfflineBuilder(
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
                    data.GetEventByCategorie(2);
                  });

                  return Future.delayed(const Duration(seconds: 2));
                },
                child: Center(
                  child: FutureBuilder<List<OneEventViewModel>>(
                    future: data.FetchAllEvents(query: "gdg"),
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
                                        builder: (context) => OnEventView(
                                              id: events[index].id,
                                            )),
                                  );
                                },
                                child: EventCardWidget(
                                  description: events![index].description,
                                  events: events,
                                  date_heure: events[index].date_heure,
                                  libelle: events[index].libelle,
                                  prix: events[index].prix,
                                  adresse: events[index].adresse,
                                )));
                      }
                    }),
                  ),
                ),
              );
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
        ));
  }
}
