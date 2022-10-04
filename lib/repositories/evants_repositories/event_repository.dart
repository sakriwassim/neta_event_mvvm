import 'package:neta_event_mvvm/models/event_model.dart';

import '../../models/add_event_model.dart';

abstract class EventsRepository {
  Future<List<EventModel>> getAllEvents();
  Future<EventModel> getEventByID(int id);
  Future<EventModel> updateEventByID(EventModel eventModel);
  Future<AddEventModel> addEvent(AddEventModel addEventModel);
}
