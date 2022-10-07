import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/event_repository.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/events_api.dart';

import '../models_events/add_event_model.dart';
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

  Future<OneEventViewModel> GetEventByID(int id) async {
    var eventModel = await eventsRepository!.getEventByID(id);
    return OneEventViewModel(eventModel: eventModel);
  }

  Future<bool> UpdateEventByID(EventModel eventModel) async {
    var event = await eventsRepository!.updateEventByID(eventModel);
    return true;
  }

  Future<bool> AddEvent(AddEventModel addEventModel) async {
    var event = await eventsRepository!.addEvent(addEventModel);
    return true;
  }

  Future<bool> DeleteEventByID(int id) async {
    var eventModel = await eventsRepository!.deleteEventByID(id);
    return true;
  }

  Future<bool> CleanPref() async {
    var eventModel = await eventsRepository!.cleanpref();
    return true;
  }
}
