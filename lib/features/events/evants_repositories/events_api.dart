import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/string.dart';
import '../models_events/add_event_model.dart';

class EventsApi {
  @override
  Future<EventModel> getEventByID(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      var TOKEN =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9mcm96ZW4tcmVmdWdlLTgwOTY1Lmhlcm9rdWFwcC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjY0NTUwNTIzLCJleHAiOjE2NjQ1NTQxMjMsIm5iZiI6MTY2NDU1MDUyMywianRpIjoiSTV2RENLb3NnUVVhWHo2bCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjMsImVtYWlsIjoid2Fzc2ltbEBlbWFpbC5jb20ifQ.JrZwVjPqWU_TZ4YrylOtcyMzQg-XoGYcV7hE9fHLGc";

      // try {
      var headersa = {'Authorization': 'Bearer $token'};
      String link = '$baseUrl/Events/$id';
      var url = Uri.parse(link);

      http.Response response = await http.get(url, headers: headersa);
      EventModel.fromJson(json.decode(response.body));
      var eventDate = EventModel.fromJson(json.decode(response.body));

      return eventDate;
    } catch (e) {
      throw Exception('can not load event data');
    }
  }

  @override
  Future<List<EventModel>> getAllEvents(String query) async {
    try {
      List<EventModel> eventsList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWRtaW4uc2FpdGVjaC1ncm91cC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjcwNjg1Nzg4LCJleHAiOjE2NzA2ODkzODgsIm5iZiI6MTY3MDY4NTc4OCwianRpIjoiMmlOOFpKY0YxaEVWRmlQQiIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjEsImVtYWlsIjoibW9uZW1haWxAZW1haWwuY29tIn0.e7A7ojhXSnETV8hT1nsitagqCXKMZ5iuTJwxAlQTwoY";

      Map<String, dynamic> payload = Jwt.parseJwt(token);

      DateTime? expiryDate = Jwt.getExpiryDate(token);

      var headersa = {'Authorization': 'Bearer $token'};

      String link = '$baseUrl/Events';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;

      eventsList =
          list.map((event) => EventModel.fromJson(event)).where((element) {
        final libelleLower = element.libelle!.toLowerCase();
        final searchLower = query.toLowerCase();

        return libelleLower.contains(searchLower);
      }).toList();
      return eventsList;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<EventModel>> getEventByCategorie(int id) async {
    try {
      List<EventModel> eventsList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // var token = prefs.getString("token");
      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWRtaW4uc2FpdGVjaC1ncm91cC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjcwNjg1Nzg4LCJleHAiOjE2NzA2ODkzODgsIm5iZiI6MTY3MDY4NTc4OCwianRpIjoiMmlOOFpKY0YxaEVWRmlQQiIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjEsImVtYWlsIjoibW9uZW1haWxAZW1haWwuY29tIn0.e7A7ojhXSnETV8hT1nsitagqCXKMZ5iuTJwxAlQTwoY";

      var headersa = {'Authorization': 'Bearer $token'};

      String link = '$baseUrl/EventsByCategorie/$id';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      eventsList = list.map((event) => EventModel.fromJson(event)).toList();

      return eventsList;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<EventModel> updateEventByID(EventModel eventModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //var token = prefs.getString("token");
      final eventId = eventModel.id;
      final eventModelJson = eventModel.toJSON();

      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWRtaW4uc2FpdGVjaC1ncm91cC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjcwNjg1Nzg4LCJleHAiOjE2NzA2ODkzODgsIm5iZiI6MTY3MDY4NTc4OCwianRpIjoiMmlOOFpKY0YxaEVWRmlQQiIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjEsImVtYWlsIjoibW9uZW1haWxAZW1haWwuY29tIn0.e7A7ojhXSnETV8hT1nsitagqCXKMZ5iuTJwxAlQTwoY";

      var headers = {
        'Content-type': 'application/json',
        "Accept": "application/json",
        'authorization': 'Bearer $token',
      };

      final body = eventModelJson;

      String link = '$baseUrl/Events/$eventId';

      var url = Uri.parse(link);

      http.Response response = await http.put(url,
          headers: headers, body: json.encode(eventModelJson));
      var responsebody = jsonDecode(response.body);
     
    } catch (e) {
      print(e);
    }

    return eventModel;
  }

  @override
  Future<bool> addEvent(AddEventModel addEventModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // var token = prefs.getString("token");
      final eventModelJson = addEventModel.toJson();
      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWRtaW4uc2FpdGVjaC1ncm91cC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjcwNjg1Nzg4LCJleHAiOjE2NzA2ODkzODgsIm5iZiI6MTY3MDY4NTc4OCwianRpIjoiMmlOOFpKY0YxaEVWRmlQQiIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjEsImVtYWlsIjoibW9uZW1haWxAZW1haWwuY29tIn0.e7A7ojhXSnETV8hT1nsitagqCXKMZ5iuTJwxAlQTwoY";

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };

      final body = jsonEncode(eventModelJson);

      String link = '$baseUrl/Events';

      var url = Uri.parse(link);

      http.Response response =
          await http.post(url, headers: headers, body: body);
      var responsebody = jsonEncode(response.body);
    } catch (e) {
      print(e);
    }

    return true;
  }

  @override
  Future<bool> deleteEventByID(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // var token = prefs.getString("token");

      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWRtaW4uc2FpdGVjaC1ncm91cC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjcwNjg1Nzg4LCJleHAiOjE2NzA2ODkzODgsIm5iZiI6MTY3MDY4NTc4OCwianRpIjoiMmlOOFpKY0YxaEVWRmlQQiIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjEsImVtYWlsIjoibW9uZW1haWxAZW1haWwuY29tIn0.e7A7ojhXSnETV8hT1nsitagqCXKMZ5iuTJwxAlQTwoY";

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };
      String link = '$baseUrl/Events/$id';
      var url = Uri.parse(link);

      http.Response response = await http.delete(url, headers: headers);

      return true;
    } catch (e) {
      return false;
    }
  }
}
