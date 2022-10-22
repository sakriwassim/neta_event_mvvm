import 'package:dartz/dartz.dart';
import 'package:neta_event_mvvm/features/events/models_events/add_event_model.dart';
import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/event_repository.dart';

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
  Future<bool> addEvent(AddEventModel addEventModel) {
    // TODO: implement addEvent
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteEventByID(int id) {
    // TODO: implement deleteEventByID
    throw UnimplementedError();
  }
  
  @override
  Future<EventModel> getEventByEventsByCategorie(int id) {
    // TODO: implement getEventByEventsByCategorie
    throw UnimplementedError();
  }
  
  @override
  Future<List<EventModel>> getEventByCategorie(int id) {
    // TODO: implement getEventByCategorie
    throw UnimplementedError();
  }
}
