import 'package:flutter/material.dart';

import '../../../core/size_config.dart';
import '../../../core/widgets/exclusive_card_widget.dart';
import '../../events/evants_repositories/events_api.dart';
import '../../events/view_model_events/events_view_model.dart';
import '../../events/view_model_events/one_event_view_model.dart';
import '../../events/views_events/one_event_view.dart';

class EventsExclusivesWidget extends StatelessWidget {
  EventsExclusivesWidget({
    Key? key,
  }) : super(key: key);

  var data = EventsViewModel(eventsRepository: EventsApi());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(250),
      child: FutureBuilder<List<OneEventViewModel>>(
        future: data.GetEventByCategorie(2),
        builder: ((context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child:
                    //Container()
                    CircularProgressIndicator());
          } else {
            var categories = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories?.length,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OneEventView(
                                    id: categories[index].id,
                                    image: '${categories[index].image}',
                                  )),
                        );
                      },
                      child: ExclusiveCardWidget(
                        date: "${categories![index].date_heure}",
                        image: "${categories[index].image}",
                        adresse: "${categories[index].adresse}",
                        libelle: "${categories[index].libelle}",
                        prix: "${categories[index].prix}",
                        height: getProportionateScreenHeight(250),
                        width: getProportionateScreenWidth(250),
                      ),
                    ));
          }
        }),
      ),
    );
  }
}
