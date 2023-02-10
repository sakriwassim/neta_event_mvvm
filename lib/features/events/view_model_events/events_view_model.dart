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
  bool back = false;

  Future<void> GetEventByCategorie(int id) async {
    List<EventModel> list = await EventsApi().getEventByCategorie(id);
    eventsbyCategorie = list;
    notifyListeners();
  }

  Future<void> FetchAllEvents(String query) async {
    loading = true;
    List<EventModel> list = await EventsApi().getAllEvents(query);
    allEvents = list;
    notifyListeners();
    loading = false;
    notifyListeners();
  }

  Future<void> GetEventByID(int id) async {
    loading = true;
    eventsbyID = await EventsApi().getEventByID(id);
    notifyListeners();
    loading = false;
    notifyListeners();
  }

  Future<void> UpdateEventByID(EventModel eventModel) async {
    var event = await EventsApi().updateEventByID(eventModel);
    if (event?.statusCode == 200) {
      back = true;
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }

  Future<void> AddEvent(AddEventModel addEventModel) async {
    // loading = true;
    var event = await EventsApi().addEvent(addEventModel);
    // print(event);
    if (event?.statusCode == 201) {
      back = true;
      notifyListeners();
    }
    // loading = false;
    // notifyListeners();
  }

  Future<void> DeleteEventByID(int id) async {
    loading = true;
    var response = await EventsApi().deleteEventByID(id);
    notifyListeners();
    if (response?.statusCode == 200) {
      back = true;
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }
}
