import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/event_repository.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/events_api.dart';

import '../entry_repositories/event_repository.dart';

class EntryViewModel {
  String title = "Event Page ";

  EntryRepository? entryRepository;
  EntryViewModel({this.entryRepository});

  Future<String> Gettokenformpref() async {
    var token = await entryRepository!.gettokenformpref();
    return token;
  }

  // Future<bool> Checktoken() async {
  //   var token = await entryRepository!.checktoken();
  //   return token;
  // }
}
