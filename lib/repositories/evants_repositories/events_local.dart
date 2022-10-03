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
}
