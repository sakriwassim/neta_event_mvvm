import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/string.dart';
import '../models_events/add_event_model.dart';
import '../models_events/event_model.dart';
import '../view_model_events/events_view_model.dart';
import 'event_repository.dart';

class UsersApi extends UsersRepository {
  @override
  Future<UserModel> getUserByID(int? id) async {
    try {
      var TOKEN =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWRtaW4uc2FpdGVjaC1ncm91cC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjcwNjg1Nzg4LCJleHAiOjE2NzA2ODkzODgsIm5iZiI6MTY3MDY4NTc4OCwianRpIjoiMmlOOFpKY0YxaEVWRmlQQiIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjEsImVtYWlsIjoibW9uZW1haWxAZW1haWwuY29tIn0.e7A7ojhXSnETV8hT1nsitagqCXKMZ5iuTJwxAlQTwoY";

      var headersa = {'Authorization': 'Bearer $TOKEN'};
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
      var token = prefs.getString("token");

      var headersa = {'Authorization': 'Bearer ${token!}'};

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
  Future<AddUserModel> updateUserByID(AddUserModel eventModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      var data = UsersViewModel(eventsRepository: UsersApi());
      var userconnected = await data.GetUserConnected();

      var TOKEN =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWRtaW4uc2FpdGVjaC1ncm91cC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjcwNjg1Nzg4LCJleHAiOjE2NzA2ODkzODgsIm5iZiI6MTY3MDY4NTc4OCwianRpIjoiMmlOOFpKY0YxaEVWRmlQQiIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjEsImVtYWlsIjoibW9uZW1haWxAZW1haWwuY29tIn0.e7A7ojhXSnETV8hT1nsitagqCXKMZ5iuTJwxAlQTwoY";

      final eventModelJson = eventModel.toJson();

      var headers = {
        'Content-type': 'application/json',
        "Accept": "application/json",
        'authorization': 'Bearer $token',
      };

      final body = eventModelJson;

      String link = '$baseUrl/User/${userconnected.id}';

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
  Future<bool> addUser(AddUserModel addUserModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      var TOKEN =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWRtaW4uc2FpdGVjaC1ncm91cC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjcwNjg1Nzg4LCJleHAiOjE2NzA2ODkzODgsIm5iZiI6MTY3MDY4NTc4OCwianRpIjoiMmlOOFpKY0YxaEVWRmlQQiIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjEsImVtYWlsIjoibW9uZW1haWxAZW1haWwuY29tIn0.e7A7ojhXSnETV8hT1nsitagqCXKMZ5iuTJwxAlQTwoY";

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
        'authorization': 'Basic +$token'
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
