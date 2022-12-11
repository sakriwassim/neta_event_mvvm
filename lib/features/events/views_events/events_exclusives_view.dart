import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/events_api.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/events_view_model.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';
import 'package:neta_event_mvvm/features/events/views_events/add_event_view.dart';
import 'package:neta_event_mvvm/features/events/views_events/widgets/event_card_widget.dart';

import '../../../core/colors.dart';
import '../../../core/widgets/small_button_style.dart';
import 'one_event_view.dart';

class GetExcusivesEventView extends StatefulWidget {
  const GetExcusivesEventView({super.key});

  @override
  State<GetExcusivesEventView> createState() => _GetExcusivesEventViewState();
}

class _GetExcusivesEventViewState extends State<GetExcusivesEventView> {
  var data = EventsViewModel(eventsRepository: EventsApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        shadowColor: Colors.white,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.title,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddEventView()));
                },
                child: Button(
                  text: "ADD EVENT",
                  height: 40,
                  width: 100,
                  fontSize: 15,
                  gradientbackground: gradientbackground,
                )),
          ],
        ),
      ),
      body: OfflineBuilder(
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
                  future: data.GetEventByCategorie(2),
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
      ),
    );
  }
}
