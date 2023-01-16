import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../users/evants_repositories/events_api.dart';
import '../../users/view_model_events/events_view_model.dart';
import '../authentification_repositories/authentification_repository.dart';
import '../models_authentification/response_model.dart';
import '../models_authentification/token_model.dart';

class AuthentificationViewModel {
  String title = "Event Page ";

  AuthentificationRepository? authentificationRepository;
  AuthentificationViewModel({this.authentificationRepository});

  Future<LoginResponseModel> Login(String mail, String password) async {
    LoginResponseModel? authentificationResponseModel;
    String? authentificationtoken;

    var authentification =
        await authentificationRepository!.login(mail, password);
    authentificationResponseModel =
        LoginResponseModel.fromJson(authentification);
    var token = authentificationResponseModel.data!.token;
    var code = authentificationResponseModel.code;
    Map<String, dynamic> payload = Jwt.parseJwt(token!);
    var tokenModel = TokenModel.fromJson(payload);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var data = UsersViewModel(eventsRepository: UsersApi());
    var userrole = await data.GetUserByID(tokenModel.userId);

    prefs.setString("userrole", userrole.role_id.toString());
    prefs.setString("token", authentificationtoken.toString());
    prefs.setString("userconnectedid", tokenModel.userId.toString());

    return authentificationResponseModel;
  }

  Future<RegisterResponseModel> Register(
      int role_id, String nom_complet, String email, String password) async {
    RegisterResponseModel? registerResponseModel;

    var authentification = await authentificationRepository!
        .register(role_id, nom_complet, email, password);

    registerResponseModel = RegisterResponseModel.fromJson(authentification);

    return registerResponseModel;
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
