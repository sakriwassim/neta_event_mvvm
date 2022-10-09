import 'package:dartz/dartz.dart';
import 'package:neta_event_mvvm/features/events/models_events/add_event_model.dart';
import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/event_repository.dart';
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

  // Future<bool> checktoken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString("token").toString();
  //   if (token.isNotEmpty || token != "" || token != null) {
  //     print("tokennnnnnnnnnnnnnnnnnnnnn");
  //     print(token);
  //     return false;
  //   }
  //   return true;
  // }
}
