import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/events/views_events/widgets/event_card_widget_home.dart';

import 'features/events/models_events/event_model.dart';
import 'features/events/view_model_events/events_view_model.dart';
import 'features/events/views_events/one_event_view.dart';

class SearchElement extends SearchDelegate {
  var data = EventsViewModel();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: FutureBuilder<List<EventModel>>(
        // future: data.FetchAllEvents(query),
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
                                  eventModel: events[index],
                                )),
                      );
                    },
                    child: EventCardWidget(
                      description: events![index].description,
                      date_heure: events[index].dateHeure,
                      libelle: events[index].libelle,
                      adresse: events[index].adresse,
                      prix: events[index].prix,
                      image: events[index].image,
                    )));
          }
        }),
      ),
    );
  }
}
