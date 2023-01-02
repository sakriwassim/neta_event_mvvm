
import '../entry_repositories/event_repository.dart';

class EntryViewModel {
  String title = "Event Page ";

  EntryRepository? entryRepository;
  EntryViewModel({this.entryRepository});

  Future<String> Gettokenformpref() async {
    var token = await entryRepository!.gettokenformpref();
    return token;
  }

 
}
