import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models_packs/pack_model.dart';
import 'pack_repository.dart';

//PackModel
class PacksApi extends PacksRepository {
  @override
  Future<PackModel> getPackByID(int id) async {
    try {
      var TOKEN =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9mcm96ZW4tcmVmdWdlLTgwOTY1Lmhlcm9rdWFwcC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjY0NTUwNTIzLCJleHAiOjE2NjQ1NTQxMjMsIm5iZiI6MTY2NDU1MDUyMywianRpIjoiSTV2RENLb3NnUVVhWHo2bCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjMsImVtYWlsIjoid2Fzc2ltbEBlbWFpbC5jb20ifQ.JrZwVjPqWU_TZ4YrylOtcyMzQg-XoGYcV7hE9fHLGc";
      // try {
      var headersa = {'Authorization': 'Bearer $TOKEN'};
      String link =
          'https://frozen-refuge-80965.herokuapp.com/api/v1/TypePack' + "${id}";
      var url = Uri.parse(link);

      http.Response response = await http.get(url, headers: headersa);

      //var responsebody = jsonDecode(response.body);

      // print(eventData);
      PackModel.fromJson(json.decode(response.body));
      var eventDate = PackModel.fromJson(json.decode(response.body));

      return eventDate;
    } catch (e) {
      throw Exception('can not load event data');
    }
  }

  @override
  Future<List<PackModel>> getAllPacks() async {
    try {
      List<PackModel> eventsList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      var headersa = {'Authorization': 'Bearer ${token!}'};

      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/TypePack';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      eventsList = list.map((event) => PackModel.fromJson(event)).toList();
      //  print(responsebody);
      return eventsList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<PackModel> updatePackByID(PackModel packModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final eventId = packModel.id;
      final eventModelJson = packModel.toJSON();

      var headers = {
        'Content-type': 'application/json',
        "Accept": "application/json",
        'authorization': 'Bearer $token',
      };

      final body = eventModelJson;

      String link =
          'https://frozen-refuge-80965.herokuapp.com/api/v1/TypePack/$eventId';

      var url = Uri.parse(link);

      http.Response response = await http.put(url,
          headers: headers, body: json.encode(eventModelJson));
      var responsebody = jsonDecode(response.body);
      // print(eventModelJson);
      print(responsebody);
    } catch (e) {
      print(e);
    }

    return packModel;
    //throw UnimplementedError();
  }

  @override
  Future<bool> addPack(PackModel packModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final eventModelJson = packModel.toJSON();

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };

      final body = jsonEncode(eventModelJson);

      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/TypePack';

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
  Future<bool> deletePackByID(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };
      String link =
          'https://frozen-refuge-80965.herokuapp.com/api/v1/TypePack/' +
              "${id}";
      var url = Uri.parse(link);

      http.Response response = await http.delete(url, headers: headers);

      return true;
    } catch (e) {
      return false;
    }
  }
}
