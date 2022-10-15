import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/events/view_model_events/one_event_view_model.dart';

import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';

class OnEventView extends StatefulWidget {
  const OnEventView({super.key});

  @override
  State<OnEventView> createState() => _OnEventViewState();
}

class _OnEventViewState extends State<OnEventView> {
  var data = EventsViewModel(eventsRepository: EventsApi());
  //var api = EventsApi().getEventByID(2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title)),
      body: Center(
        child: FutureBuilder<OneEventViewModel>(
          future: data.GetEventByID(2),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.adresse);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }),
        ),
      ),
      // Text(data.GetEventByID(2).toString())
    );
  }
}
