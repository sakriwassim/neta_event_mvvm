import 'dart:convert';
import 'package:neta_event_mvvm/models/event_model.dart';
import 'package:neta_event_mvvm/repositories/evants_repositories/event_repository.dart';
import 'package:http/http.dart' as http;

class EventsApi extends EventsRepository {
  // Future<EventModel> eventData;
  //eventData = getEventByID(int id)

  @override
  Future<EventModel> getEventByID(int id) async {
    var TOKEN =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9mcm96ZW4tcmVmdWdlLTgwOTY1Lmhlcm9rdWFwcC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjY0NTUwNTIzLCJleHAiOjE2NjQ1NTQxMjMsIm5iZiI6MTY2NDU1MDUyMywianRpIjoiSTV2RENLb3NnUVVhWHo2bCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjMsImVtYWlsIjoid2Fzc2ltbEBlbWFpbC5jb20ifQ.JrZwVjPqWU_TZ4YrylOtcyMzQg-XoGYcV7hE9fHLGc";
    // try {
    var headersa = {'Authorization': 'Bearer ' + TOKEN};
    String link =
        'https://frozen-refuge-80965.herokuapp.com/api/v1/Events/' + "${id}";
    var url = Uri.parse(link);

    http.Response response = await http.get(url, headers: headersa);

    //var responsebody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // print(eventData);
      EventModel.fromJson(json.decode(response.body));
      var eventDate = EventModel.fromJson(json.decode(response.body));
      return eventDate;
    } else {
      throw Exception('can not load event data');
    }
    //return eventData;
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Future<List<EventModel>> getAllEvents() async {
    List<EventModel> eventsList = [];
    var TOKEN =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9mcm96ZW4tcmVmdWdlLTgwOTY1Lmhlcm9rdWFwcC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjY0NTUwNTIzLCJleHAiOjE2NjQ1NTQxMjMsIm5iZiI6MTY2NDU1MDUyMywianRpIjoiSTV2RENLb3NnUVVhWHo2bCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjMsImVtYWlsIjoid2Fzc2ltbEBlbWFpbC5jb20ifQ.JrZwVjPqWU_TZ4YrylOtcyMzQg-XoGYcV7hE9fHLGc";

    try {
      var headersa = {'Authorization': 'Bearer ' + TOKEN};

      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/Events';

      var url = Uri.parse(link);
      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      eventsList = list.map((event) => EventModel.fromJson(event)).toList();
      //  print(responsebody);
    } catch (e) {
      print(e);
    }
    print(eventsList);
    return eventsList;
  }
}
