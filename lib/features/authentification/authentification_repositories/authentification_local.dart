import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';

import 'package:neta_event_mvvm/features/events/models_events/add_event_model.dart';

import '../../events/evants_repositories/event_repository.dart';

import 'authentification_repository.dart';

class EventsLocal extends AuthentificationRepository {
  @override
  Future<bool> login(loginModel) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool> register(registerModel) {
    // TODO: implement register
    throw UnimplementedError();
  }
  
  @override
  Future<bool> cleanpref() {
    // TODO: implement cleanpref
    throw UnimplementedError();
  }
}
