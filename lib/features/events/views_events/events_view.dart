import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:neta_event_mvvm/core/widgets/small_button_style.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/events_api.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/events_view_model.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';
import 'package:neta_event_mvvm/features/events/views_events/add_event_view.dart';
import 'package:neta_event_mvvm/features/events/views_events/widgets/event_card_widget.dart';

import 'update_event_view.dart';

class GetAllEventView extends StatefulWidget {
  const GetAllEventView({super.key});

  @override
  State<GetAllEventView> createState() => _GetAllEventViewState();
}

class _GetAllEventViewState extends State<GetAllEventView> {
  var data = EventsViewModel(eventsRepository: EventsApi());

  alertupdate(OneEventViewModel obj) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('êtes-vous sûr!!'),
          content: const Text('de mettre à jour la valeur de compteur'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'MODIFY');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateEventView(eventObj: obj)));
              },
              child: const Text('MODIFY'),
            ),
            TextButton(
                child: const Text('DELETE'),
                onPressed: () {
                  Navigator.pop(context, 'DELETE');
                  setState(() {
                    data.DeleteEventByID(obj.id);
                  });
                }),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddEventView()));
                },
                child: SmallButton(text: "ADD EVENT")),
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
                  data.FetchAllEvents();
                });

                return Future.delayed(Duration(seconds: 2));
              },
              child: Center(
                child: FutureBuilder<List<OneEventViewModel>>(
                  future: data.FetchAllEvents(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      var events = snapshot.data;
                      return ListView.builder(
                          itemCount: events?.length,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                alertupdate(events![index]);
                              },
                              child: EventCardWidget(
                                description: events![index].description,
                                events: events,
                                date_heure: events![index].date_heure,
                                libelle: events![index].libelle,
                                prix: events![index].prix,
                                adresse: events![index].adresse,
                              )));
                    }
                  }),
                ),
              ),
            );
          } else {
            return Center(
              child: Text("no connection"),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
