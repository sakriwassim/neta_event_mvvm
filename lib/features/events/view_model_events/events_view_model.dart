import 'package:flutter/cupertino.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/events_api.dart';
import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';

import '../models_events/add_event_model.dart';

class EventsViewModel extends ChangeNotifier {
  String title = "Event Page ";
  List<EventModel> allEvents = [];
  List<EventModel> eventsbyCategorie = [];
  EventModel? eventsbyID;
  bool loading = false;

  Future<void> GetEventByCategorie(int id) async {
    List<EventModel> list = await EventsApi().getEventByCategorie(id);
    eventsbyCategorie = list;
    notifyListeners();
  }

  Future<void> FetchAllEvents(String query) async {
    List<EventModel> list = await EventsApi().getAllEvents(query);
    allEvents = list;
    notifyListeners();
  }

  Future<void> GetEventByID(int id) async {
    loading = true;
    eventsbyID = await EventsApi().getEventByID(id);
    notifyListeners();
    loading = false;
    notifyListeners();
  }

  Future<bool> UpdateEventByID(EventModel eventModel) async {
    var event = await EventsApi().updateEventByID(eventModel);
    return true;
  }

  Future<bool> AddEvent(AddEventModel addEventModel) async {
    var event = await EventsApi().addEvent(addEventModel);
    return true;
  }

  Future<bool> DeleteEventByID(int id) async {
    var eventModel = await EventsApi().deleteEventByID(id);
    return true;
  }
}
