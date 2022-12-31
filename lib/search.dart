import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'features/events/evants_repositories/events_api.dart';
import 'features/events/view_model_events/events_view_model.dart';
import 'features/events/view_model_events/one_event_view_model.dart';
import 'features/events/views_events/one_event_view.dart';
import 'features/events/views_events/widgets/event_card_widget.dart';

class SearchElement extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  var data = EventsViewModel(eventsRepository: EventsApi());

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Expanded(
      child: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return Center(
              child: FutureBuilder<List<OneEventViewModel>>(
                future: data.FetchAllEvents(""),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
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
                                    builder: (context) => OneEventView(
                                          id: events[index].id,
                                          image: '',
                                        )),
                              );
                            },
                            child: EventCardWidgetHome(
                              description: events![index].description,
                              events: events,
                              date_heure: events[index].date_heure,
                              libelle: events[index].libelle,
                              adresse: events[index].adresse,
                              image: events[index].image,
                            )));
                  }
                }),
              ),
            );
          } else {
            return const Center(
              child: Text("no connection"),
            );
          }
        },
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search Event'),
    );
  }
}
