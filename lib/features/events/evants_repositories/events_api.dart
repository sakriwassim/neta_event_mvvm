import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';
import 'package:neta_event_mvvm/features/events/evants_repositories/event_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models_events/add_event_model.dart';

class EventsApi extends EventsRepository {
  @override
  Future<EventModel> getEventByID(int id) async {
    try {
      var TOKEN =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9mcm96ZW4tcmVmdWdlLTgwOTY1Lmhlcm9rdWFwcC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjY0NTUwNTIzLCJleHAiOjE2NjQ1NTQxMjMsIm5iZiI6MTY2NDU1MDUyMywianRpIjoiSTV2RENLb3NnUVVhWHo2bCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjMsImVtYWlsIjoid2Fzc2ltbEBlbWFpbC5jb20ifQ.JrZwVjPqWU_TZ4YrylOtcyMzQg-XoGYcV7hE9fHLGc";
      // try {
      var headersa = {'Authorization': 'Bearer ' + TOKEN};
      String link =
          'https://frozen-refuge-80965.herokuapp.com/api/v1/Events/' + "${id}";
      var url = Uri.parse(link);

      http.Response response = await http.get(url, headers: headersa);

      //var responsebody = jsonDecode(response.body);

      // print(eventData);
      EventModel.fromJson(json.decode(response.body));
      var eventDate = EventModel.fromJson(json.decode(response.body));

      return eventDate;
    } catch (e) {
      throw Exception('can not load event data');
    }
  }

  @override
  Future<List<EventModel>> getAllEvents() async {
    try {
      List<EventModel> eventsList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      var headersa = {'Authorization': 'Bearer ' + token!};

      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/Events';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      eventsList = list.map((event) => EventModel.fromJson(event)).toList();
      //  print(responsebody);
      return eventsList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<EventModel> updateEventByID(EventModel eventModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final eventId = eventModel.id;
      final eventModelJson = eventModel.toJSON();

      var headers = {
        'Content-type': 'application/json',
        "Accept": "application/json",
        'authorization': 'Bearer $token',
      };

      final body = eventModelJson;

      String link =
          'https://frozen-refuge-80965.herokuapp.com/api/v1/Events/$eventId';

      var url = Uri.parse(link);

      http.Response response = await http.put(url,
          headers: headers, body: json.encode(eventModelJson));
      var responsebody = jsonDecode(response.body);
      // print(eventModelJson);
      print(responsebody);
    } catch (e) {
      print(e);
    }

    return eventModel;
    //throw UnimplementedError();
  }

  @override
  Future<bool> addEvent(AddEventModel addEventModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final eventModelJson = addEventModel.toJson();

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };

      final body = jsonEncode(eventModelJson);

      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/Events';

      var url = Uri.parse(link);

      http.Response response =
          await http.post(url, headers: headers, body: body);
      var responsebody = jsonEncode(response.body);
      // print(eventModelJson);
      print(responsebody);
    } catch (e) {
      print(e);
    }

    return true;

    //throw UnimplementedError();
  }

  @override
  Future<bool> deleteEventByID(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };
      String link =
          'https://frozen-refuge-80965.herokuapp.com/api/v1/Events/' + "${id}";
      var url = Uri.parse(link);

      http.Response response = await http.delete(url, headers: headers);

      return true;
    } catch (e) {
      return false;
    }
  }
}
