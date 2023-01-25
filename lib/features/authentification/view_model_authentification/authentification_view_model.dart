import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../users/evants_repositories/events_api.dart';
import '../../users/view_model_events/events_view_model.dart';
import '../authentification_repositories/authentification_api.dart';
import '../models_authentification/response_model.dart';
import '../models_authentification/token_model.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AuthentificationViewModel extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  bool isLogin = true;
  bool isSwitched = true;
  bool obscureText2 = true;
  bool obscureText = true;
  String message = "";
  int selectIndex = -1;

  googlefonction() {
    print("""object""");
    notifyListeners();
  }

  setobscureText2() {
    obscureText2 = !obscureText2;
    notifyListeners();
  }

  setobscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  setisIndex(index) {
    selectIndex = index;
    notifyListeners();
  }

  setisLogin() {
    isLogin = !isLogin;
    notifyListeners();
  }

  setisSwitched() {
    isSwitched = !isSwitched;

    notifyListeners();
  }

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
        var token = authentificationResponseModel.data!.token;

        /**********************savedata token *************** */
        SharedPreferences prefs = await SharedPreferences.getInstance();

        Map<String, dynamic> payload = Jwt.parseJwt(token!);
        var tokenModel = TokenModel.fromJson(payload);

        var data = UsersViewModel(eventsRepository: UsersApi());
        var userrole = await data.GetUserByID(tokenModel.userId);

        prefs.setString("userrole", userrole.role_id.toString());
        prefs.setString("token", token);
        prefs.setString("userconnectedid", tokenModel.userId.toString());
        /********************************* */
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
  }

  Future<void> Register(
      int role_id, String nom_complet, String email, String password) async {
    loading = true;
    notifyListeners();

    Response? response = await AuthentificationApi()
        .register(role_id, nom_complet, email, password);
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
  }
}
