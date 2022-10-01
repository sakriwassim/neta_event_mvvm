import 'package:neta_event_mvvm/models/event_model.dart';
import 'package:neta_event_mvvm/repositories/evants_repositories/event_repository.dart';
import 'package:neta_event_mvvm/repositories/evants_repositories/events_api.dart';

import 'one_event_view_model.dart';

class EventsViewModel {
  String title = "Event Page ";
  EventsRepository? eventsRepository;
  EventsViewModel({this.eventsRepository});
  Future<List<OneEventViewModel>> FetchAllEvents() async {
    List<EventModel> list = await eventsRepository!.getAllEvents();
    return list
        .map((listEvent) => OneEventViewModel(eventModel: listEvent))
        .toList();
  }
}
