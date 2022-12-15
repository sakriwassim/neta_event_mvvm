import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:neta_event_mvvm/core/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models_authentification/login_authentification_model.dart';
import '../models_authentification/response_model.dart';
import 'authentification_repository.dart';

class AuthentificationApi extends AuthentificationRepository {
  String? verif;
  String? authentificationtoken;
  int? code;
  String? token;

  @override
  Future<bool> login(AuthentificationModel authentificationModel) async {
    try {
      final eventModelJson = authentificationModel.toJSON();
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final body = jsonEncode(eventModelJson);

      String link = '$baseUrl/Login';

      var url = Uri.parse(link);

      http.Response response =
          await http.post(url, headers: headers, body: body);
      var responsebody = jsonEncode(response.body);
      var responsebodydecode = jsonDecode(response.body);
      //print(responsebodydecode);

      AuthentificationResponseModel authentificationResponseModel =
          AuthentificationResponseModel.fromJson(responsebodydecode);

      var token = authentificationResponseModel.data.token;
      //var iduser = authentificationResponseModel.code;
      var code = authentificationResponseModel.code;

      // print(token);
      // print(code);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      prefs.setString("token", authentificationtoken.toString());
      //  prefs.setString("iduser", authentificationtoken.toString());
      //  print("Seccess");

      return true;
    } catch (e) {
      print("Mouchkla fi il log in $e");
      return false;
    }
  }

  @override
  Future<bool> register(AuthentificationModel registerModel) async {
    try {
      final eventModelJson = registerModel.toJSON();
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final body = jsonEncode(eventModelJson);

      String link = '$baseUrl/Register';

      var url = Uri.parse(link);

      http.Response response =
          await http.post(url, headers: headers, body: body);
      var responsebody = jsonEncode(response.body);

      // print(responsebody);
      return true;
    } catch (e) {
      // print(e);
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
