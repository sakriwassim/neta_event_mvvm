// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'package:neta_event_mvvm/features/events/evants_repositories/events_api.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/events_view_model.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';
import 'package:neta_event_mvvm/features/events/views_events/widgets/event_card_widget_home.dart';

import 'one_event_view.dart';
import 'widgets/event_card_widget.dart';

class GetEventByCategorisView extends StatefulWidget {
  int categorieid;
  GetEventByCategorisView({
    Key? key,
    required this.categorieid,
  }) : super(key: key);

  @override
  State<GetEventByCategorisView> createState() =>
      _GetEventByCategorisViewState();
}

class _GetEventByCategorisViewState extends State<GetEventByCategorisView> {
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
                  data.GetEventByCategorie(widget.categorieid);
                });

                return Future.delayed(const Duration(seconds: 2));
              },
              child: Center(
                child: FutureBuilder<List<OneEventViewModel>>(
                  future: data.GetEventByCategorie(widget.categorieid),
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
                                      builder: (context) => OneEventView(
                                            id: events[index].id,
                                            image: "${events[index].image}",
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
      ),
    );
  }
}
