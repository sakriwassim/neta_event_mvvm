import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentification_repositories/authentification_repository.dart';
import '../models_authentification/login_authentification_model.dart';
import '../models_authentification/token_model.dart';

class AuthentificationViewModel {
  String title = "Event Page ";

  AuthentificationRepository? authentificationRepository;
  AuthentificationViewModel({this.authentificationRepository});

  Future<bool> Login(AuthentificationModel authentificationModel) async {
    var authentification =
        await authentificationRepository!.login(authentificationModel);

    return authentification;
  }

  Future<bool> Register(AuthentificationModel authentificationModel) async {
    var authentification =
        await authentificationRepository!.register(authentificationModel);
    return authentification;
  }

  Future<bool> Cleanpref() async {
    try {
      var token = await authentificationRepository!.cleanpref();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<TokenModel> Gettokenmodel() async {
    var tokenmodel = await authentificationRepository!.gettokenmodel();
    return tokenmodel;
  }
}
