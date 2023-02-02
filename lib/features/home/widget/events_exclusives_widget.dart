// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/size_config.dart';
import '../../../core/widgets/exclusive_card_widget.dart';
import '../../events/evants_repositories/events_api.dart';
import '../../events/models_events/event_model.dart';
import '../../events/view_model_events/events_view_model.dart';
import '../../events/views_events/one_event_view.dart';

class EventsExclusivesWidget extends StatelessWidget {
  List<EventModel> eventsexclusives;
  EventsExclusivesWidget({
    Key? key,
    required this.eventsexclusives,
  }) : super(key: key);

  var data = EventsViewModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(250),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: eventsexclusives.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OneEventView(
                              eventModel: eventsexclusives[index],
                            )),
                  );
                },
                child: ExclusiveCardWidget(
                  date: "${eventsexclusives[index].dateHeure}",
                  image: "${eventsexclusives[index].image}",
                  adresse: "${eventsexclusives[index].adresse}",
                  libelle: "${eventsexclusives[index].libelle}",
                  prix: "${eventsexclusives[index].prix}",
                  height: getProportionateScreenHeight(250),
                  width: getProportionateScreenWidth(250),
                ),
              )),
    );
  }
}
