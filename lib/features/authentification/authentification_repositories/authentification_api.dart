import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:neta_event_mvvm/core/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../users/evants_repositories/events_api.dart';
import '../../users/view_model_events/events_view_model.dart';
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
  Future<AuthentificationResponseModel> login(
      AuthentificationModel authentificationModel) async {
    AuthentificationResponseModel? authentificationResponseModel;

    try {
      final eventModelJson = authentificationModel.toJson();
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

      authentificationResponseModel =
          AuthentificationResponseModel.fromJson(responsebodydecode);

      var token = authentificationResponseModel.data!.token;
      var code = authentificationResponseModel.code;

      Map<String, dynamic> payload = Jwt.parseJwt(token!);
      var tokenModel = TokenModel.fromJson(payload);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString("token", authentificationtoken.toString());
      prefs.setString("userconnectedid", tokenModel.userId.toString());

      var data = UsersViewModel(eventsRepository: UsersApi());
      var userrole = await data.GetUserByID(tokenModel.userId);
      prefs.setString("userrole", userrole.role_id.toString());

      print("Seccess");
      print("  *********userconnectedid**********  ${tokenModel.userId}");
      print(
          "  *********Stateocode **********  ${authentificationResponseModel.code}");

      // if (response.statusCode == 200) {
      return authentificationResponseModel;
    } catch (e) {
      print("PROBLEM  sur login $e");
      throw UnimplementedError();
    }
  }

  @override
  Future<bool> register(AuthentificationModel registerModel) async {
    try {
      final eventModelJson = registerModel.toJson();
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

  getuserrole() async {
    final prefs = await SharedPreferences.getInstance();
    final userrole = prefs.getInt("userrole");
    return userrole;
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
