import 'package:neta_event_mvvm/features/authentification/models_authentification/token_model.dart';

import '../models_authentification/login_authentification_model.dart';
import '../models_authentification/response_model.dart';

abstract class AuthentificationRepository {
  Future<bool> register(AuthentificationModel authentificationModel);
  Future<AuthentificationResponseModel> login(
      AuthentificationModel authentificationModel);
  Future<bool> cleanpref();
  Future<TokenModel> gettokenmodel();
}
