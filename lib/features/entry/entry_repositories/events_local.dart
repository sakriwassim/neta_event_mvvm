import 'package:shared_preferences/shared_preferences.dart';

import 'event_repository.dart';

class EntryLocal extends EntryRepository {
  @override
  Future<String> gettokenformpref() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token").toString();
      // print(token);
      return token;
    } catch (e) {
      throw UnimplementedError();
    }
  }

}
