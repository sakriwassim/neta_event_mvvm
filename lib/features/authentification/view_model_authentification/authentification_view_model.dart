import 'package:shared_preferences/shared_preferences.dart';

import '../authentification_repositories/authentification_repository.dart';
import '../models_authentification/response_model.dart';
import '../models_authentification/token_model.dart';

class AuthentificationViewModel {
  String title = "Event Page ";

  AuthentificationRepository? authentificationRepository;
  AuthentificationViewModel({this.authentificationRepository});

  Future<LoginResponseModel> Login(
      String mail, String password) async {
    var authentification =
        await authentificationRepository!.login(mail, password);

    return authentification;
  }


  Future<RegisterResponseModel> Register(int role_id, String nom_complet, String email, String password) async {
    var authentification =
        await authentificationRepository!.register( role_id,  nom_complet,  email,  password);
    return authentification;
  }

  Future<TokenModel> Gettokenmodel() async {
    var tokenmodel = await authentificationRepository!.gettokenmodel();
    return tokenmodel;
  }

  Future Gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    return token;
  }
}
