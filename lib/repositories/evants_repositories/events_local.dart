import 'package:neta_event_mvvm/models/add_event_model.dart';
import 'package:neta_event_mvvm/models/event_model.dart';
import 'package:neta_event_mvvm/repositories/evants_repositories/event_repository.dart';

class EventsLocal extends EventsRepository {
  @override
  Future<List<EventModel>> getAllEvents() {
    // TODO: implement getAllEvents
    throw UnimplementedError();
  }

  @override
  Future<EventModel> getEventByID(int id) {
    // TODO: implement getEventByID
    throw UnimplementedError();
  }

  @override
  Future<EventModel> updateEventByID(EventModel eventModel) {
    throw UnimplementedError();
  }

  @override
  Future<AddEventModel> addEvent(AddEventModel addEventModel) {
    // TODO: implement addEvent
    throw UnimplementedError();
  }
}
