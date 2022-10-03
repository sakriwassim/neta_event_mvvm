import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/repositories/evants_repositories/events_api.dart';
import 'package:neta_event_mvvm/view_model/events_view_model.dart';
import 'package:neta_event_mvvm/view_model/one_event_view_model.dart';

import 'update_event_view.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  // dependency Injection
  var data = EventsViewModel(eventsRepository: EventsApi());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title)),
      body: Center(
        child: FutureBuilder<List<OneEventViewModel>>(
          future: data.FetchAllEvents(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              var events = snapshot.data;
              return ListView.builder(
                  itemCount: events?.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(events![index].id.toString()),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateEventView(
                                      eventObj: events![index])));
                        },
                      ));
            }
          }),
        ),
      ),
    );
  }
}
