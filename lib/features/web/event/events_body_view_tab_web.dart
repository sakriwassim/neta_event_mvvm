import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/features/events/views_events/widgets/event_card_widget.dart';

import '../../events/evants_repositories/events_api.dart';
import '../../events/view_model_events/events_view_model.dart';
import '../../events/view_model_events/one_event_view_model.dart';
import '../../events/views_events/one_event_view.dart';
import 'event_card_grid_widget.dart';

class GetAllEventViewBodyTabWeb extends StatefulWidget {
  const GetAllEventViewBodyTabWeb({super.key});

  @override
  State<GetAllEventViewBodyTabWeb> createState() =>
      _GetAllEventViewBodyTabWebState();
}

class _GetAllEventViewBodyTabWebState extends State<GetAllEventViewBodyTabWeb> {
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
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5),
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
                              child: EventCardGrindWidget(
                                description: events![index].description,
                                //  events: events,
                                date_heure: events[index].date_heure,
                                libelle: events[index].libelle,
                                prix: events[index].prix,
                                adresse: events[index].adresse,
                              )),
                        );
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
