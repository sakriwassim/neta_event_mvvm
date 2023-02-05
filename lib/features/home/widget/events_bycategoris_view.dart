// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:neta_event_mvvm/features/events/view_model_events/events_view_model.dart';

import '../../../core/size_config.dart';
import '../../events/models_events/event_model.dart';
import '../../events/views_events/one_event_view.dart';
import '../../events/views_events/widgets/event_card_widget.dart';

class GetEventByCategorisWidget extends StatelessWidget {
  List<EventModel> eventsbyCategorie;
  GetEventByCategorisWidget({
    Key? key,
    required this.eventsbyCategorie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(300),
      child: Center(
        child: ListView.builder(
            itemCount: eventsbyCategorie.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OneEventView(
                              eventModel: eventsbyCategorie[index],
                            )),
                  );
                },
                child: EventCardWidgetHome(
                  description: eventsbyCategorie[index].description,
                  date_heure: eventsbyCategorie[index].dateHeure,
                  libelle: eventsbyCategorie[index].libelle,
                  adresse: eventsbyCategorie[index].adresse,
                  image: eventsbyCategorie[index].image,
                ))),
      ),
    );
  }
}
