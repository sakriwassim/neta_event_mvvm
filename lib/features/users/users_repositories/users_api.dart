import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/string.dart';
import '../models_users/add_event_model.dart';
import '../models_users/event_model.dart';

class UsersApi {
  @override
  Future<UserModel> getUserByID(int? id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      var headersa = {'Authorization': 'Bearer $token'};
      String link = '$baseUrl/User/$id';
      var url = Uri.parse(link);

      http.Response response = await http.get(url, headers: headersa);

      UserModel.fromJson(json.decode(response.body));
      var eventDate = UserModel.fromJson(json.decode(response.body));

      return eventDate;
    } catch (e) {
      throw Exception('can not load event data');
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      List<UserModel> eventsList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      var headersa = {'Authorization': 'Bearer ${token!}'};

      String link = '$baseUrl/User';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      eventsList = list.map((event) => UserModel.fromJson(event)).toList();

      return eventsList;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<UserModel>> getUserByCategorie(int id) async {
    try {
      List<UserModel> eventsList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token") ?? "";

      var headersa = {'Authorization': 'Bearer ${token}'};

      String link = '$baseUrl/UsersByCategorie/$id';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      eventsList = list.map((event) => UserModel.fromJson(event)).toList();

      return eventsList;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<http.Response?> updateUserByID(
      AddUserModel eventModel, String userconnectedId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      final eventModelJson = eventModel.toJson();

      var headers = {
        'Content-type': 'application/json',
        "Accept": "application/json",
        'authorization': 'Bearer $token',
      };

      final body = eventModelJson;

      String link = '$baseUrl/User/${userconnectedId}';

      var url = Uri.parse(link);

      http.Response response = await http.put(url,
          headers: headers, body: json.encode(eventModelJson));

      return response;
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<bool> addUser(AddUserModel addUserModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      final eventModelJson = addUserModel.toJson();

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic $token'
      };

      final body = jsonEncode(eventModelJson);

      String link = '$baseUrl/User';

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
  Future<bool> deleteUserByID(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic $token'
      };
      String link = '$baseUrl/User/$id';
      var url = Uri.parse(link);

      http.Response response = await http.delete(url, headers: headers);

      return true;
    } catch (e) {
      return false;
    }
  }
}
