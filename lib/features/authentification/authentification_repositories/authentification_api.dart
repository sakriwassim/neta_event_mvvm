import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:neta_event_mvvm/core/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models_authentification/login_authentification_model.dart';
import '../models_authentification/response_model.dart';
import '../models_authentification/token_model.dart';
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
      var code = authentificationResponseModel.code;

      Map<String, dynamic> payload = Jwt.parseJwt(token);
      var tokenModel = TokenModel.fromJson(payload);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      prefs.setString("token", authentificationtoken.toString());
      prefs.setString("userconnectedid", tokenModel.userId.toString());

      print("Seccess");
      print("*********userconnectedid**********  ${tokenModel.userId}");
      return true;
    } catch (e) {
      print("PROBLEM  sur login $e");
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
      print("PROBLEM  sur register $e");
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

  @override
  Future<TokenModel> gettokenmodel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    Map<String, dynamic> payload = Jwt.parseJwt(token.toString());
    var tokenModel = TokenModel.fromJson(payload);
    return tokenModel;
  }
}

/**
 
 iss: http://frozen-refuge-80965.herokuapp.com/api/v1/Login, iat: 1664550523, exp: 1664554123, nbf: 1664550523, jti: I5vDCKosgQUaXz6l, sub: 3, prv: 23bd5c8949f600adb39e701c400872db7a5976f7, user_id: 3, email: wassiml@email.com
 */