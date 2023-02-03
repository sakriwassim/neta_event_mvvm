import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/string.dart';
import '../models_tickets/add_ticket_model.dart';
import '../models_tickets/ticket_model.dart';

class TicketsApi {
  @override
  Future<TicketModel> getTicketByID(int id) async {
    try {
      var TOKEN =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9mcm96ZW4tcmVmdWdlLTgwOTY1Lmhlcm9rdWFwcC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjY0NTUwNTIzLCJleHAiOjE2NjQ1NTQxMjMsIm5iZiI6MTY2NDU1MDUyMywianRpIjoiSTV2RENLb3NnUVVhWHo2bCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjMsImVtYWlsIjoid2Fzc2ltbEBlbWFpbC5jb20ifQ.JrZwVjPqWU_TZ4YrylOtcyMzQg-XoGYcV7hE9fHLGc";
      // try {
      var headersa = {'Authorization': 'Bearer $TOKEN'};
      String link = '$baseUrl/Tickets/$id';
      var url = Uri.parse(link);

      http.Response response = await http.get(url, headers: headersa);

      TicketModel.fromJson(json.decode(response.body));
      var ticketDate = TicketModel.fromJson(json.decode(response.body));

      return ticketDate;
    } catch (e) {
      throw Exception('can not load ticket data');
    }
  }

  @override
  Future<List<TicketModel>> getTicketsByUser(int id) async {
    try {
      List<TicketModel> ticketsList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      var headersa = {'Authorization': 'Bearer ${token!}'};

      String link = '$baseUrl/TicketsByUser/$id';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      ticketsList = list.map((ticket) => TicketModel.fromJson(ticket)).toList();
      print(responsebody);
      return ticketsList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<TicketModel>> getAllTickets() async {
    try {
      List<TicketModel> ticketsList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      var headersa = {'Authorization': 'Bearer ${token!}'};

      String link = '$baseUrl/Tickets';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      ticketsList = list.map((ticket) => TicketModel.fromJson(ticket)).toList();
      print(responsebody);
      return ticketsList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<bool> deleteTicketByID(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };
      String link = '$baseUrl/Tickets/$id';
      var url = Uri.parse(link);

      http.Response response = await http.delete(url, headers: headers);

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> addTicket(AddTicketModel addTicketModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final eventModelJson = addTicketModel.toJSON();

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };

      final body = jsonEncode(eventModelJson);

      String link = '$baseUrl/Tickets';

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
  }

  @override
  Future<AddTicketModel> updateTicketByID(AddTicketModel addTicketModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final eventId = addTicketModel.event_id;
      final eventModelJson = addTicketModel.toJSON();

      var headers = {
        'Content-type': 'application/json',
        "Accept": "application/json",
        'authorization': 'Bearer $token',
      };

      final body = eventModelJson;

      String link = '$baseUrl/Tickets/$eventId';

      var url = Uri.parse(link);

      http.Response response = await http.put(url,
          headers: headers, body: json.encode(eventModelJson));
      var responsebody = jsonDecode(response.body);
      // print(eventModelJson);
      print(responsebody);
    } catch (e) {
      print(e);
    }

    return addTicketModel;
  }
}
