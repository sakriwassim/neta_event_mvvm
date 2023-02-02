import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:neta_event_mvvm/core/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models_authentification/token_model.dart';

class AuthentificationApi {
  @override
  Future<Response?> login(String mail, String password) async {
    http.Response? response;
    try {
      var userJson = {"email": mail, "password": password};
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final body = jsonEncode(userJson);

      String link = '$baseUrl/Login';

      var url = Uri.parse(link);

      response = await http.post(url, headers: headers, body: body);

      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<http.Response?> register(
      int role_id, String nom_complet, String email, String password) async {
    http.Response? response;
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      var userjdon = {
        "role_id": role_id,
        "packs_id": 1,
        "nom_complet": nom_complet,
        "email": email,
        "telephone": 70213645,
        "adresse": "Faladiè",
        "image": "https://cheminverslimage",
        "password": password
      };

      final body = jsonEncode(userjdon);

      String link = '$baseUrl/Register';

      var url = Uri.parse(link);

      response = await http.post(url, headers: headers, body: body);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

}
