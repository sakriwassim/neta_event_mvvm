import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';

import '../models_events/add_event_model.dart';

abstract class EventsRepository {
  Future<List<EventModel>> getEventByCategorie(int id);
  Future<List<EventModel>> getAllEvents({String? query});
  Future<EventModel> getEventByID(int id);
  Future<EventModel> updateEventByID(EventModel eventModel);
  Future<bool> addEvent(AddEventModel addEventModel);
  Future<bool> deleteEventByID(int id);
}
