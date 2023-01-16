import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:neta_event_mvvm/core/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../users/evants_repositories/events_api.dart';
import '../../users/view_model_events/events_view_model.dart';
import '../models_authentification/response_model.dart';
import '../models_authentification/token_model.dart';
import 'authentification_repository.dart';

class AuthentificationApi extends AuthentificationRepository {
  @override
  Future<void> login(String mail, String password) async {
    try {
      var userJson = {"email": "$mail", "password": "$password"};
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final body = jsonEncode(userJson);

      String link = '$baseUrl/Login';

      var url = Uri.parse(link);

      http.Response response =
          await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        var responsebodydecode = jsonDecode(response.body);
        return responsebodydecode;
      }
      print("failed");
      //return null;
    } catch (e) {
      //Future.value();
      print("PROBLEM  sur login $e");
      throw UnimplementedError();
    }
  }

  @override
  Future<dynamic> register(
      int role_id, String nom_complet, String email, String password) async {
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

      http.Response response =
          await http.post(url, headers: headers, body: body);

      var responsebodydecode = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return responsebodydecode;
      }
      print("failed");
    } catch (e) {
      print("PROBLEM  sur register $e");
      throw UnimplementedError();
    }
  }

  getuserrole() async {
    final prefs = await SharedPreferences.getInstance();
    final userrole = prefs.getInt("userrole");
    return userrole;
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
