import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/widgets/alert_dialo_widget.dart';
import '../../../home_view.dart';
import '../models_authentification/login_authentification_model.dart';
import '../models_authentification/response_model.dart';
import 'authentification_repository.dart';

class AuthentificationApi extends AuthentificationRepository {
  //List tonken = [];
  String? verif;
  String? authentificationtoken;
  int? code;
  String? token;
  @override
  Future<bool> login(AuthentificationModel registerModel) async {
    try {
      // final eventId = eventModel.id;
      final eventModelJson = registerModel.toJSON();

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final body = jsonEncode(eventModelJson);

      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/Login';

      var url = Uri.parse(link);

      http.Response response =
          await http.post(url, headers: headers, body: body);
      var responsebody = jsonEncode(response.body);
      var responsebodydecode = jsonDecode(response.body);

      AuthentificationResponseModel authentificationResponseModel =
          AuthentificationResponseModel.fromJson(responsebodydecode);

      var token = authentificationResponseModel.data.token;
      var code = authentificationResponseModel.code;

      // print(eventModelJson);
      //print(responsebody);
      print(token);
      print(code);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      prefs.setString("token", authentificationtoken.toString());
      print("Seccess");

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> register(AuthentificationModel registerModel) async {
    try {
      // final eventId = eventModel.id;
      final eventModelJson = registerModel.toJSON();

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final body = jsonEncode(eventModelJson);

      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/Register';

      var url = Uri.parse(link);

      http.Response response =
          await http.post(url, headers: headers, body: body);
      var responsebody = jsonEncode(response.body);
      // print(eventModelJson);
      print(responsebody);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> cleanpref() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return true;
    } catch (e) {
      return false;
    }
  }
}



 // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    // prefs.setString("token", authentificationtoken.toString());
    // print("Seccess");

    //   if (responsebody != null) {}
    // } else if (response.statusCode == 401) {

    //     authentificationModel authentification =
    //     authentificationModel.toObject(responsebody);

    // var authentificationtoken = authentification.access_token;