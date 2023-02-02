import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/tickets/views_tickets/ticket_card_widget/ticket_card.dart';

import '../../../../core/size_config.dart';
import '../../models_events/event_model.dart';
import '../one_event_view.dart';
import 'event_card_widget_home.dart';

class EventsWidget extends StatelessWidget {
  List<EventModel>? events;

  EventsWidget({
    Key? key,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: events?.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OneEventView(
                            eventModel: events![index],
                          )),
                );
              },
              child: EventCardWidget(
                description: events![index].description,
                
                date_heure: events![index].dateHeure,
                libelle: events![index].libelle,
                adresse: events![index].adresse,
                prix: events![index].prix,
                image: events![index].image,
              ))),
    );
  }
}
