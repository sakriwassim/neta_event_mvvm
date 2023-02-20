import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models_tontines/add_tontine_model.dart';
import '../models_tontines/tontine_model.dart';

class TontinesApi {
  Future<TontineModel> getTontineByID(int id) async {
    try {
      var TOKEN =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9mcm96ZW4tcmVmdWdlLTgwOTY1Lmhlcm9rdWFwcC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjY0NTUwNTIzLCJleHAiOjE2NjQ1NTQxMjMsIm5iZiI6MTY2NDU1MDUyMywianRpIjoiSTV2RENLb3NnUVVhWHo2bCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjMsImVtYWlsIjoid2Fzc2ltbEBlbWFpbC5jb20ifQ.JrZwVjPqWU_TZ4YrylOtcyMzQg-XoGYcV7hE9fHLGc";
      var headersa = {'Authorization': 'Bearer $TOKEN'};
      String link = 'https://admin.saitech-group.com/api/v1/Tontine/$id';
      var url = Uri.parse(link);
      http.Response response = await http.get(url, headers: headersa);
      TontineModel.fromJson(json.decode(response.body));
      var ticketDate = TontineModel.fromJson(json.decode(response.body));
      return ticketDate;
    } catch (e) {
      throw Exception('can not load ticket data');
    }
  }

  Future<List<TontineModel>> getAllTontines() async {
    try {
      List<TontineModel> ticketsList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      var headersa = {'Authorization': 'Bearer ${token!}'};

      String link = 'https://admin.saitech-group.com/api/v1/Tontine';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      ticketsList =
          list.map((ticket) => TontineModel.fromJson(ticket)).toList();
      // print(responsebody);
      return ticketsList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> deleteTontineByID(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };
      String link = 'https://admin.saitech-group.com/api/v1/Tontine/$id';
      var url = Uri.parse(link);

      http.Response response = await http.delete(url, headers: headers);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Either<String?, Unit?>> addTontine(
      AddTontineModel? tontineModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final eventModelJson = tontineModel?.toJson();
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };
      final body = jsonEncode(eventModelJson);
      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/Tontine';
      var url = Uri.parse(link);
      http.Response response =
          await http.post(url, headers: headers, body: body);
      if (response.statusCode == 201) {
        return Right(unit);
      }
      return Left("server error" + response.statusCode.toString());
    } on SocketException {
      return Left('No Internet connection 😑');
    } on HttpException {
      return Left("Couldn't find the post 😱");
    } on FormatException {
      return Left("Bad response format 👎");
    } 
  }

  Future<TontineModel> updateTontineByID(TontineModel addTontineModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final eventId = addTontineModel.id;
      final eventModelJson = addTontineModel.toJSON();

      var headers = {
        'Content-type': 'application/json',
        "Accept": "application/json",
        'authorization': 'Bearer $token',
      };

      final body = eventModelJson;

      String link = 'https://admin.saitech-group.com/api/v1/Tontine/$eventId';

      var url = Uri.parse(link);

      http.Response response = await http.put(url,
          headers: headers, body: json.encode(eventModelJson));
      var responsebody = jsonDecode(response.body);
      // print(eventModelJson);
      // print(responsebody);
    } catch (e) {
      print(e);
    }

    return addTontineModel;
  }
}
