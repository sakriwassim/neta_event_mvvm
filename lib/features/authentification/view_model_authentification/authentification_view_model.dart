import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../users/evants_repositories/events_api.dart';
import '../../users/view_model_events/events_view_model.dart';
import '../authentification_repositories/authentification_api.dart';
import '../authentification_repositories/authentification_repository.dart';
import '../models_authentification/response_model.dart';
import '../models_authentification/token_model.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AuthentificationViewModel extends ChangeNotifier {
  String title = "Event Page ";
  String error = "";
  bool loading = false;
  bool isBack = false;
  String message = "";

  Future<void> Login(String mail, String password) async {
    loading = true;
    notifyListeners();

    Response? response = await AuthentificationApi().login(mail, password);
    print(response);

    var responsebodydecode = jsonDecode(response!.body);

    if (response.statusCode == 200) {
      var authentificationResponseModel =
          LoginResponseModel.fromJson(responsebodydecode);
      if (authentificationResponseModel.code == 200) {
        isBack = true;
      }
      message = authentificationResponseModel.message!;
      notifyListeners();
      print(message);
    } else {
      message = "pannes de serveur";
      notifyListeners();
    }
    loading = false;
    notifyListeners();

    // var token = authentificationResponseModel!.data!.token;
    // var code = authentificationResponseModel!.code;
    // Map<String, dynamic> payload = Jwt.parseJwt(token!);
    // var tokenModel = TokenModel.fromJson(payload);

    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // var data = UsersViewModel(eventsRepository: UsersApi());
    // var userrole = await data.GetUserByID(tokenModel.userId);

    // prefs.setString("userrole", userrole.role_id.toString());
    // prefs.setString("token", authentificationtoken.toString());
    // prefs.setString("userconnectedid", tokenModel.userId.toString());

    // notifyListeners();

    //return authentificationResponseModel;
  }

  // Future<RegisterResponseModel> Register(
  //     int role_id, String nom_complet, String email, String password) async {
  //   RegisterResponseModel? registerResponseModel;

  //   var authentification = await AuthentificationApi()
  //       .register(role_id, nom_complet, email, password);

  //   // registerResponseModel = RegisterResponseModel.fromJson(authentification);

  //   return registerResponseModel;
  // }

  // Future<TokenModel> Gettokenmodel() async {
  //   var tokenmodel = await authentificationRepository!.gettokenmodel();
  //   return tokenmodel;
  // }

  Future Gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    return token;
  }
}
