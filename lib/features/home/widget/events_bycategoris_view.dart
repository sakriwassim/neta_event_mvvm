// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:neta_event_mvvm/features/events/view_model_events/events_view_model.dart';

import '../../../core/size_config.dart';
import '../../events/models_events/event_model.dart';
import '../../events/views_events/one_event_view.dart';
import '../../events/views_events/widgets/event_card_widget.dart';

class GetEventByCategorisWidget extends StatefulWidget {
  int categorieid;
  GetEventByCategorisWidget({
    Key? key,
    required this.categorieid,
  }) : super(key: key);

  @override
  State<GetEventByCategorisWidget> createState() =>
      _GetEventByCategorisWidgetState();
}

class _GetEventByCategorisWidgetState extends State<GetEventByCategorisWidget> {
  var data = EventsViewModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(300),
      child: Center(
        child: FutureBuilder<List<EventModel>>(
          // future: data.GetEventByCategorie(widget.categorieid),
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
                      child: EventCardWidgetHome(
                        description: events![index].description,
                        // events: events!,
                        date_heure: events[index].dateHeure,
                        libelle: events[index].libelle,
                        adresse: events[index].adresse,
                        image: events[index].image,
                      )));
            }
          }),
        ),
      ),
    );
  }
}
