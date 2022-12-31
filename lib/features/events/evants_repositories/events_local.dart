import 'package:neta_event_mvvm/features/events/models_events/add_event_model.dart';
import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/event_repository.dart';

class EventsLocal extends EventsRepository {
  @override
  Future<List<EventModel>> getAllEvents(String query) {
    throw UnimplementedError();
  }

  @override
  Future<EventModel> getEventByID(int id) {
    throw UnimplementedError();
  }

  @override
  Future<EventModel> updateEventByID(EventModel eventModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> addEvent(AddEventModel addEventModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteEventByID(int id) {
    throw UnimplementedError();
  }

  @override
  Future<EventModel> getEventByEventsByCategorie(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<EventModel>> getEventByCategorie(int id) {
    throw UnimplementedError();
  }
}
